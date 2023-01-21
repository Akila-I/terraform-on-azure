terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }
  backend "azurerm" {
    # cannot use variables in initializing
    # resource_group_name  = var.resource_group_name - DOESNT WORK

    resource_group_name  = "RG_NAME"
    storage_account_name = "SA_NAME"
    container_name       = "CONT_NAME"
    key                  = "FILE_NAME"
  }
}
output "AVSET_ID" {
  description = "Availability set of VM id"
  value = azurerm_availability_set.test_avset_VM.id
}

provider "azurerm" {
  # Configuration options
  features {}
} 

# https://developer.hashicorp.com/terraform/language/values/locals
# declaring local variables
locals {
  location = "East US 2"
  resource_group = "akila_test_rg_2"
  fault_domain = 2
  update_domain = 6
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set
resource "azurerm_availability_set" "test_avset_1" {
  name                = "akila_test_avset_1"
  
  # accessing local variables
  location            = local.location
  resource_group_name = local.resource_group

  platform_update_domain_count = local.update_domain
  platform_fault_domain_count = local.fault_domain
}

resource "azurerm_availability_set" "test_avset_2" {
  name                = "akila_test_avset_2"

  # accessing local variables
  location            = local.location
  resource_group_name = local.resource_group

  platform_update_domain_count = local.update_domain
  platform_fault_domain_count = local.fault_domain
}

resource "azurerm_availability_set" "test_avset_VM" {
  name                = "AVSET"

  # accessing local variables
  location            = local.location
  resource_group_name = local.resource_group

  platform_update_domain_count = local.update_domain
  platform_fault_domain_count = local.fault_domain
} 