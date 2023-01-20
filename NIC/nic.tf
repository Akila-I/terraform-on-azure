terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }
}
  provider "azurerm" {
    # Configuration options
    features {}
  }

data "terraform_remote_state" "subnetID" {
  backend = "azurerm"

  config = {
    resource_group_name  = "akila_test_rg_2"
    storage_account_name = "STORAGE_ACCOUNT_NAME"
    container_name       = "CONTAINER_NAME"
    key                  = "TFSTATE_FILE"
  }
}

resource "azurerm_network_interface" "test_nic_1" {
  name                = "akila_test_nic_1"
  location            = "East US 2"
  resource_group_name = "akila_test_rg_2"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.subnetID.outputs.DevSubnet
    private_ip_address_allocation = "Dynamic"
  }
}