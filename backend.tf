terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate123"
    container_name       = "tfstate"
    key                  = "terraform-azure.tfstate"
  }
}
