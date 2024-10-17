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
    subscription_id = "de706246-7701-45d8-9039-c4d720e7a39b"
    features {}
  }
}
provider "modtm" "config" {}
provider "random" "config" {}

