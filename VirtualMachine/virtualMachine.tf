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

data "azurerm_network_interface" "NIC1" {
  name                = "network-interface1"
  resource_group_name = "akila_test_rg_2"
}

data "azurerm_network_interface" "NIC2" {
  name                = "network-interface2"
  resource_group_name = "akila_test_rg_2"
}

data "terraform_remote_state" "AVSET" {
  backend = "azurerm"

  config = {
    resource_group_name  = "RG_NAME"
    storage_account_name = "SA_NAME"
    container_name       = "CONT_NAME"
    key                  = "FILE_NAME"
  }
}

locals {
  size      = "Standard_F2"
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2016-Datacenter"
  version   = "latest"
}

resource "azurerm_windows_virtual_machine" "VM1" {
  admin_password        = "ADMIN@1234"
  admin_username        = "adminuser"
  location              = var.location
  name                  = "VM1"
  network_interface_ids = [data.azurerm_network_interface.NIC1.id]
  resource_group_name   = var.resource_group_name
  size                  = local.size
  availability_set_id = data.terraform_remote_state.AVSET.outputs.AVSET_ID
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer     = local.offer
    publisher = local.publisher
    sku       = local.sku
    version   = local.version
  }

}

resource "azurerm_windows_virtual_machine" "VM2" {
  admin_password        = "ADMIN@1234"
  admin_username        = "adminuser"
  location              = var.location
  name                  = "VM2"
  network_interface_ids = [data.azurerm_network_interface.NIC2.id]
  resource_group_name   = var.resource_group_name
  size                  = local.size
  availability_set_id = data.terraform_remote_state.AVSET.outputs.AVSET_ID
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer     = local.offer
    publisher = local.publisher
    sku       = local.sku
    version   = local.version
  }

}