identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "development" {
  inputs = {
    env             = ["dev"]
    region          = "uksouth"
    name            = "devteststacks"
    identity_token  = identity_token.azurerm.jwt
    client_id       = "8d9ecc5d-4d7a-4549-b4dd-3cac6034f144"
    subscription_id = "5201c2d1-b62c-4952-bdf8-beaef29a7559"
    tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"

  }
}
