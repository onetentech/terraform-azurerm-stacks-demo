output "peer_id" {
  value       = azurerm_virtual_network_peering.main.id
  description = "The ID of the virtual network peering."
}
