
variable "region" {
  type = map(object({
    subscription_id = "string"
    tenant_id       = "string"
    client_id       = "string"
  }))
  default = {
    hub = {
      location        = "uksouth"
      subscription_id = "5201c2d1-b62c-4952-bdf8-beaef29a7559"
      tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
      client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
    }
  }

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



# Envs cannot be used for authentication, so we need to pass the identity token to the provider.
