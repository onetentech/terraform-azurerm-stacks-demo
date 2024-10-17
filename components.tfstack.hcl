
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
    name     = "${var.name}-${each.key}"
    location = var.region
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
    name                = "${var.name}-${each.key}"
    resource_group_name = component.resource_group[each.key].name
    location            = var.region
    address_space       = var.address_space
  }
}
