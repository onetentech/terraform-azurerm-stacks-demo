required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.5.0"
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

provider "azurerm" "configuration" {
  for_each = var.env
  config {
    subscription_id = each.value.subscription_id
    features {}
  }
}

