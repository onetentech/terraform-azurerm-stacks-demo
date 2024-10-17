variable "name" {
  type = string
}
variable "region" {
  type = string
}
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

variable "client_id" { type = string }
variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

# Envs cannot be used for authentication, so we need to pass the identity token to the provider.
