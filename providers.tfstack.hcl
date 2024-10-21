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
locals {
  landingzones = {
    hub = {
      subscription_id = "3c828e3e-a2fc-44f2-b3d2-abcce0792d79"
      client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
      tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
    }
    alz001 = {
      subscription_id = "de706246-7701-45d8-9039-c4d720e7a39b"
      client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
      tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
    }
    alz002 = {
      subscription_id = "5201c2d1-b62c-4952-bdf8-beaef29a7559"
      client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
      tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
    }
  }
}

provider "azurerm" "config" {
  for_each = local.landingzones
  config {
    features {}
    // use_cli should be set to false to yield more accurate error messages on auth failure.
    use_cli = false
    // use_oidc must be explicitly set to true when using multiple configurations.
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = each.value.client_id
    subscription_id = each.value.subscription_id
    tenant_id       = each.value.tenant_id
  }
}
provider "azapi" "config" {
  for_each = local.landingzones
  config {
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = each.value.client_id
    subscription_id = each.value.subscription_id
    tenant_id       = each.value.tenant_id
  }
}
provider "modtm" "config" {}
provider "random" "config" {}

