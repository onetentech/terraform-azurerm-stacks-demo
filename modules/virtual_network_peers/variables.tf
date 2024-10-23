variable "name" {
  type        = string
  description = "The name of the virtual network peering"
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "remote_virtual_network_id" {
  type        = string
  description = "The ID of the remote virtual network"
}

variable "allow_forwarded_traffic" {
  type        = bool
  description = "Allow forwarded traffic"
  default     = false
}

variable "allow_gateway_transit" {
  type        = bool
  description = "Allow gateway transit"
  default     = false
}

variable "use_remote_gateways" {
  type        = bool
  description = "Use remote gateways"
  default     = false
}
variable "allow_virtual_network_access" {
  type        = bool
  description = "Allow virtual network access"
  default     = false
}
