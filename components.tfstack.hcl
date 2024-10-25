
component "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
  providers = {
    random = provider.random.config
  }
  inputs = {
    suffix = ["mmu", "conn", var.env]

  }
}
component "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.1.0"
  providers = {
    azurerm = provider.azurerm.config[var.env]
    random  = provider.random.config
    modtm   = provider.modtm.config
  }
  inputs = {
    name     = component.naming.resource_group.name
    location = var.location
  }
}
output "vnet_id" {
  type = string
  description = "The ID of the virtual network"
  value = component.networks.resource_id
}
component "networks" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.4.2"
  providers = {
    azurerm = provider.azurerm.config[var.env]
    random  = provider.random.config
    modtm   = provider.modtm.config
    azapi   = provider.azapi.config[var.env]
  }
  inputs = {
    name                = component.naming.virtual_network.name
    resource_group_name = component.resource_group.name
    location            = var.location
    address_space       = var.address_space
  }
}

component "peers" {
  source = "./modules/virtual_network_peers"
  providers = {
    azurerm = provider.azurerm.config[var.env]
  }
  inputs = {
    name                        = "some_name"
    resource_group_name         = component.resource_group.name
    virtual_network_name        = component.networks.name
    remote_virtual_network_id   = component.networks.outputs["alz001"].vnet_id
  }
}