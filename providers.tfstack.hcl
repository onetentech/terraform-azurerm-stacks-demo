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
  time = {
    source  = "hashicorp/time"
    version = "~> 0.1"
  }
  local = {
    source  = "hashicorp/local"
    version = "~> 2.4"
  }
}

provider "azurerm" "config" {
  config {
    subscription_id = each.value.subscription_id
    features {}
  }
}
provider "modtm" "config" {}
provider "random" "config" {}

