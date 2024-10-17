
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
    name     = var.name
    location = var.env[each.key].default_region
  }
}
