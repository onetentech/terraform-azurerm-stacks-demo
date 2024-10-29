
component "naming" {
  for_each = var.env
  source   = "Azure/naming/azurerm"
  version  = "0.4.1"
  providers = {
    random = provider.random.config
  }
  inputs = {
    suffix = ["mmu", "conn", each.key]

  }
}
component "resource_group" {
  for_each = var.env
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.1.0"
  providers = {
    azurerm = provider.azurerm.config[each.key]
    random  = provider.random.config
    modtm   = provider.modtm.config
  }
  inputs = {
    name     = component.naming.resource_group.name
    location = each.value.location
  }
}
output "vnet_id" {
  type        = string
  description = "The ID of the virtual network"
  value       = { for k, vnets in component.networks : k => vnets.outputs.vnet_id }
}
component "networks" {
  for_each = var.env
  source   = "Azure/avm-res-network-virtualnetwork/azurerm"
  version  = "0.4.2"
  providers = {
    azurerm = provider.azurerm.config[each.key]
    random  = provider.random.config
    modtm   = provider.modtm.config
    azapi   = provider.azapi.config[each.key]
  }
  inputs = {
    name                = component.naming.virtual_network.name
    resource_group_name = component.resource_group.name
    location            = each.value.location
    address_space       = each.value.address_space
  }
}
component "hub_peers" {
  for_each = { for k, value in var.env : k => value if k != "hub" }
  source   = "./modules/virtual_network_peers"
  providers = {
    azurerm = provider.azurerm.config[each.key]
  }
  inputs = {
    name                      = "hub_to_peer"
    resource_group_name       = component.resource_group.name
    virtual_network_name      = component.networks["hub"].outputs.vnet_name
    remote_virtual_network_id = component.networks[each.key].outputs.vnet_id
    allow_forwarded_traffic   = false
  }
}
component "spoke_peers" {
  for_each = { for k, value in var.env : k => value if k != "hub" }
  source   = "./modules/virtual_network_peers"
  providers = {
    azurerm = provider.azurerm.config[each.key]
  }
  inputs = {
    name                         = "peer_to_hub "
    resource_group_name          = component.resource_group.name
    virtual_network_name         = component.networks[each.key].outputs.vnet_name
    remote_virtual_network_id    = component.networks["hub"].outputs.vnet_id
    allow_forwarded_traffic      = false
    allow_gateway_transit        = true
    use_remote_gateways          = true
    allow_virtual_network_access = false
  }
}
