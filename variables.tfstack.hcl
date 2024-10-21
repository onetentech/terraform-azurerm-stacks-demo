variable "env" {
  type = set(string)
}

variable "identity_token" {
  type      = string
  ephemeral = true
}
variable "address_space" {
  type = list(string)
}
variable "location" {
  type    = string
  default = "uksouth"
}


# Envs cannot be used for authentication, so we need to pass the identity token to the provider.
