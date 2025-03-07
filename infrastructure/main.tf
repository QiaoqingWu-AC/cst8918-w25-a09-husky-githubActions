# Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
}

# Define the resource group in Azure
resource "azurerm_resource_group" "rg" {
  name = "${var.labelPrefix}-a09-rg"
  location = var.region
}

# Define a storage account
resource "azurerm_storage_account" "storage" {
  resource_group_name = azurerm_resource_group.rg.name
  name = "${var.labelPrefix}a09storage"
  location = var.region
  account_tier = "Standard"
  account_replication_type = "LRS"
}