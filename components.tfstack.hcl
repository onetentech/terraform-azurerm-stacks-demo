
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
    name     = component.naming[each.key].resource_group.name
    location = each.value.location
  }
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
    name                = component.naming[each.key].virtual_network.name
    resource_group_name = component.resource_group[each.key].name
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
    name                      = "hub_to_peer_${each.key}"
    resource_group_name       = component.resource_group[each.key].name
    virtual_network_name      = component.networks["hub"].name
    remote_virtual_network_id = component.networks[each.key].resource_id
    allow_forwarded_traffic      = true
    allow_gateway_transit        = true
    use_remote_gateways          = false
    allow_virtual_network_access = true
  }
}
component "spoke_peers" {
  for_each = { for k, value in var.env : k => value if k != "hub" }
  source   = "./modules/virtual_network_peers"
  providers = {
    azurerm = provider.azurerm.config[each.key]
  }
  inputs = {
    name                         = "peer_to_hub_${each.key}"
    resource_group_name          = component.resource_group[each.key].name
    virtual_network_name         = component.networks[each.key].name
    remote_virtual_network_id    = component.networks["hub"].resource_id
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = true
    allow_virtual_network_access = true
  }
}
