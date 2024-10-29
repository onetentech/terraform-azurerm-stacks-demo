output "vnet_id" {
  type        = string
  description = "The ID of the virtual network"
  value       = { for k, vnets in component.networks : k => vnets.output.vnet_id }
}