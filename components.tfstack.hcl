
component "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
  providers = {
    random = provider.random.config
  }
  inputs = {
    suffix = ["mmu", "connectivity", var.env]

  }
}
component "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.1.0"
  providers = {
    azurerm = provider.azurerm.config["hub"]
    random  = provider.random.config
    modtm   = provider.modtm.config
  }
  inputs = {
    name     = component.naming.resource_group.name
    location = "uksouth"
  }
}
component "virtual_network" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.4.2"
  providers = {
    azurerm = provider.azurerm.config["hub"]
    random  = provider.random.config
    modtm   = provider.modtm.config
    azapi   = provider.azapi.config["hub"]
  }
  inputs = {
    name                = component.naming.virtual_network.name
    resource_group_name = component.resource_group.name
    location            = var.location
    address_space       = var.address_space
  }
}
