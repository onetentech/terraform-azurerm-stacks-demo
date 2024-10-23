variable "env" {
  type = string
}

variable "identity_token" {
  type      = string
  ephemeral = true
}
variable "location" {
  type    = string
  default = "uksouth"
}
variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network"
}
variable "peers" {
  type = map(object({
    name                               = string
    address_space                      = list(string)
    remote_virtual_network_resource_id = string
    allow_forwarded_traffic            = bool
    allow_virtual_network_access       = bool
    do_not_verify_remote_gateways      = bool
    use_remote_gateways                = bool
  }))
  default = {}
}

# Envs cannot be used for authentication, so we need to pass the identity token to the provider.
