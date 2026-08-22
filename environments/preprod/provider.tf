terraform {
  required_version = ">= 1.0.0"

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"           # State store karne wala RG
    storage_account_name = "stchordevtfstate"     # Storage account naam
    container_name       = "tfstate"              # Blob container naam
    key                  = "prod.tfstate"  # State file path
    use_oidc             = true                   # OIDC auth (same as pipeline)
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}

provider "azurerm" {
  features {}
}
