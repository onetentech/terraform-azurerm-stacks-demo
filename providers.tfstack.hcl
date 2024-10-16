required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = ">= 3.0"
    }
}

provider "azurerm" "configuration" {
    for_each = var.env
    config {
        subscription_id = each.value.subscription_id
        features {}
    }
}

