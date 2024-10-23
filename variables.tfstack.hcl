variable "env" {
  type = string
}

variable "identity_token" {
  type      = string
  ephemeral = true
}
variable "hub_address_space" {
  type = list(string)
}
variable "location" {
  type    = string
  default = "uksouth"
}
variable "networks" {
  type = object({
    name          = string
    address_space = list(string)
    peerings = optional(map(object({
      name                               = string
      address_space                      = list(string)
      remote_virtual_network_resource_id = string
      allow_forwarded_traffic            = bool
      allow_virtual_network_access       = bool
      do_not_verify_remote_gateways      = bool
      use_remote_gateways                = bool
    })))
  })
}

# Envs cannot be used for authentication, so we need to pass the identity token to the provider.
