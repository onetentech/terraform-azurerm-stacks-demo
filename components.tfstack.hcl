
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
removed {
  source = "Azure/avm-res-network-virtualnetwork/azurerm"
  from   = component.virtual_network
  providers = {
    azurerm = provider.azurerm.config[var.env]
    random  = provider.random.config
    modtm   = provider.modtm.config
    azapi   = provider.azapi.config[var.env]
  }
}
component "virtual_network_hub" {
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
    address_space       = var.hub_address_space
    peerings = { for k, spoke in var.spoke_networks : k => {
      name                               = component.virtual_network_spokes[k].name,
      address_space                      = component.virtual_network_spokes[k].address_space,
      remote_virtual_network_resource_id = component.virtual_network_spokes[k].id
      allow_forwarded_traffic            = true
      allow_virtual_network_access       = true
      do_not_verify_remote_gateways      = false
      use_remote_gateways                = false
      }
    }
  }
}
component "virtual_network_spokes" {
  for_each = var.spoke_networks
  source   = "Azure/avm-res-network-virtualnetwork/azurerm"
  version  = "0.4.2"
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
    address_space       = each.value.address_space
    peerings = {
      hub = {
        name                               = component.virtual_network_hub.name
        address_space                      = component.virtual_network_hub.address_space
        remote_virtual_network_resource_id = component.virtual_network_hub.id
        allow_forwarded_traffic            = true
        allow_virtual_network_access       = true
        do_not_verify_remote_gateways      = false
        use_remote_gateways                = false
      }
    }
  }
}
