
component "naming" {
  for_each = var.env
  source   = "Azure/naming/azurerm"
  version  = "0.4.1"
  providers = {
    random = provider.random.config
  }
  inputs = {
    suffix = ["mmu", each.key]

  }
}
component "resource_group" {
  for_each = var.env
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.1.0"
  providers = {
    azurerm = provider.azurerm.config
    random  = provider.random.config
    modtm   = provider.modtm.config
  }
  inputs = {
    name     = component.naming[each.key].resource_group.name
    location = "uksouth"
  }
}
component "virtual_network" {
  for_each = var.env
  source   = "Azure/avm-res-network-virtualnetwork/azurerm"
  version  = "0.4.2"
  providers = {
    azurerm = provider.azurerm.config
    random  = provider.random.config
    modtm   = provider.modtm.config
    azapi   = provider.azapi.config
  }
  inputs = {
    name                = component.naming[each.key].virtual_network.name
    resource_group_name = component.resource_group[each.key].name
    location            = var.location
    address_space       = var.address_space
  }
}
