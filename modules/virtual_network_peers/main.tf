resource "azurerm_virtual_network_peering" "main" {
  name = var.name
  # The virtual network to peer from.
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  # The virtual network to peer to.
  remote_virtual_network_id = var.remote_virtual_network_id
  # The peer settings
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_virtual_network_access = var.allow_virtual_network_access
  use_remote_gateways          = var.use_remote_gateways
  allow_gateway_transit        = var.allow_gateway_transit
}
