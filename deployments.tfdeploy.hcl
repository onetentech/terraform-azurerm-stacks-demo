identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "development" {
  inputs = {
    env             = ["dev"]
    region          = "uksouth"
    name            = "devteststacks"
    identity_token  = identity_token.azurerm.jwt
    client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
    subscription_id = "5201c2d1-b62c-4952-bdf8-beaef29a7559"
    tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
  }
}
