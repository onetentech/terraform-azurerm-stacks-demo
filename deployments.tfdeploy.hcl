identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}
deployment "hub" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env            = "hub"
    location       = "uksouth"
    address_space  = ["10.10.10.0/24"]
    peers = {
      alz001 = {
        remote_virtual_network_id = deployment.alz001.ouputs.virtual_network_id
      }
    }
  }
}
deployment "alz001" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env            = "alz001"
    location       = "uksouth"
    address_space  = ["10.10.11.0/24"]
  }
}
deployment "alz002" {
  inputs = {
    identity_token = identity_token.azurerm.jwt
    env            = "alz002"
    location       = "uksouth"
    address_space  = ["10.10.12.0/24"]
  }
}