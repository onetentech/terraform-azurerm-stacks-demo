identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}
deployment "uks_hub" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env = {
      hub = {
        address_space = ["10.10.10.0/24"]
        location      = "uksouth"
      }
    }
  }
}
