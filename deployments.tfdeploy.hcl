identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}
deployment "hub" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env            = ["dev"]
    region         = "uksouth"
    address_space  = ["10.10.10.0/24"]
  }
}
deployment "alz001" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env            = ["alz001"]
    region         = "uksouth"
    address_space  = ["10.10.11.0/24"]
  }
}
deployment "alz002" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env            = ["alz001"]
    region         = "uksouth"
    address_space  = ["10.10.11.0/24"]
  }
}
