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
      alz001 = {
        address_space = ["10.10.11.0/24"]
        location      = "uksouth"
      }
      alz002 = {
        address_space = ["10.10.12.0/24"]
        location      = "uksouth"
      }
    }
  }
}
