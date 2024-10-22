variable "env" {
  type = string
}

variable "identity_token" {
  type      = string
  ephemeral = true
}
variable "hub_address_space" {
  type    = list(string)
  default = []
}
variable "location" {
  type    = string
  default = "uksouth"
}
variable "spoke_networks" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
  default = {}
}

# Envs cannot be used for authentication, so we need to pass the identity token to the provider.
