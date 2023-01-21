terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }

  # https://developer.hashicorp.com/terraform/language/settings/backends/azurerm
  backend "azurerm" {
    # cannot use variables in initializing
    # resource_group_name  = var.resource_group_name - DOESNT WORK

    resource_group_name  = "RG_NAME"
    storage_account_name = "SA_NAME"
    container_name       = "CONT_NAME"
    key                  = "FILE_NAME"
  }

}

provider "azurerm" {
  # Configuration options
  features {}
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
resource "azurerm_subnet" "test_subnet_1_PROD" {
  name = "akila_test_subnet_1_PROD"

  #   variables accessing
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name

  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "test_subnet_2_DEV" {
  name = "akila_test_subnet_2_DEV"
  #   variables accessing
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name

  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "test_subnet_3_STAGE" {
  name = "akila_test_subnet_3_STAGE"
  #   variables accessing
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name

  address_prefixes = ["10.0.3.0/24"]
}