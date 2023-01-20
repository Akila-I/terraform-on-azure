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

resource "azurerm_availability_set" "test_avset_3" {
  name                = "akila_test_avset_3"

  # accessing local variables
  location            = local.location
  resource_group_name = local.resource_group

  platform_update_domain_count = local.update_domain
  platform_fault_domain_count = local.fault_domain
} 