terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "6dfcbcd6-f548-4d1d-ad4b-b56f03eaf33e"
}
