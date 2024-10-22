identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}
deployment "hub" {
  inputs = {
    identity_token    = identity_token.azurerm.jwt
    env               = "hub"
    location          = "uksouth"
    hub_address_space = ["10.10.10.0/24"]
  }
}
deployment "spokes" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env            = "alz001"
    location       = "uksouth"
    spoke_networks = {
      spoke1 = {
        name          = "alz001"
        address_space = ["10.10.11.0/24"]
      }
      spoke2 = {
        name          = "alz003"
        address_space = ["10.10.12.0/24"]
      }
    }
  }
}
