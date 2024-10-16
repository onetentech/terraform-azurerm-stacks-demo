
component "resource_group" {
  for_each = var.env
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "1.0.0"
  providers = {
    azure = azure.configuration[each.key]
  }
  inputs = {
    name     = "avm-res-resources-rg"
    location = var.env[each.key].default_region
  }
}
