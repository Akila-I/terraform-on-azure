terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
} 

resource "azurerm_resource_group" "test_rg_2" {
  name     = "akila_test_rg_2"
  location = "East US 2"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "test_vnet_1" {
  name                = "akila_test_vnet_1"

#   interpolation to the above declared resource_group
#   also called implicit dependancy
  location            = azurerm_resource_group.test_rg_2.location
  resource_group_name = azurerm_resource_group.test_rg_2.name

  address_space       = ["10.0.0.0/16"]

}