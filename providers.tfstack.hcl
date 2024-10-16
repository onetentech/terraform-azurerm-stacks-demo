required_providers {
    azure = {
        source  = "hashicorp/azurerm"
        version = ">= 2.0"
    }
}

provider "azure" "configuration" {
    for_each = var.env
    config {
        subscription_id = each.value.subscription_id
        features {}
    }
}

