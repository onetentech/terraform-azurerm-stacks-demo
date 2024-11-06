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
  for_each = var.env
  config {
    features {}
    // use_cli should be set to false to yield more accurate error messages on auth failure.
    use_cli = false
    // use_oidc must be explicitly set to true when using multiple configurations.
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = local.landingzones[each.key].client_id
    subscription_id = local.landingzones[each.key].subscription_id
    tenant_id       = local.landingzones[each.key].tenant_id
  }
}
provider "azapi" "config" {
  for_each = var.env
  config {
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = local.landingzones[each.key].client_id
    subscription_id = local.landingzones[each.key].subscription_id
    tenant_id       = local.landingzones[each.key].tenant_id
  }
}
provider "modtm" "config" {}
provider "random" "config" {}

