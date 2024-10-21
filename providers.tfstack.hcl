required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.5.0"
  }
  random = {
    source  = "hashicorp/random"
    version = "3.6.3"
  }
  modtm = {
    source  = "Azure/modtm"
    version = "0.3.2"
  }
  azapi = {
    source  = "Azure/azapi"
    version = "~> 1.13"
  }
}

provider "azurerm" "config" {
  config {
    features {}
    // use_cli should be set to false to yield more accurate error messages on auth failure.
    use_cli = false
    // use_oidc must be explicitly set to true when using multiple configurations.
    use_oidc        = true
    client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
    subscription_id = "5201c2d1-b62c-4952-bdf8-beaef29a7559"
    tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
  }
}
provider "azapi" "config" {
  config {
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = local.landing_zones["hub"].client_id
    subscription_id = local.landing_zones["hub"].subscription_id
    tenant_id       = local.landing_zones["hub"].tenant_id
  }
}
provider "modtm" "config" {}
provider "random" "config" {}

