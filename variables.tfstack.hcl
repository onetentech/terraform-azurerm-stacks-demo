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
# This is an optional configuration block that can be used to define virtual network peers.
variable "peers" {
  type = map(object({
    allow_forwarded_traffic            = optional(bool, false)
    allow_virtual_network_access       = optional(bool, false)
    do_not_verify_remote_gateways      = optional(bool, false)
    use_remote_gateways                = optional(bool, false)
  }))
  default = {}
}

# Envs cannot be used for authentication, so we need to pass the identity token to the provider.
