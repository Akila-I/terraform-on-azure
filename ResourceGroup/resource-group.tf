terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/azurerm/
provider "azurerm" {
  # Configuration options
  features {}
} 

/**
- NOT RECOMMENDED - 

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id             = "00000000-0000-0000-0000-000000000000"
  client_id                   = "00000000-0000-0000-0000-000000000000"
  client_certificate_path     = var.client_certificate_path
  client_certificate_password = var.client_certificate_password
  tenant_id                   = "00000000-0000-0000-0000-000000000000"
}
*/

# ----------------------------------------------------

/**
- USE ENVIRONMENT VARIABLES - 

export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_CERTIFICATE_PATH="/path/to/my/client/certificate.pfx"
export ARM_CLIENT_CERTIFICATE_PASSWORD="Pa55w0rd123"
export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
*/


# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "resource-group-1" {
  name     = "test-resource-group-1-akila"
  location = "East US 2"
}

/**
- SYNTAX OF RESOURCE BLOCK -
resource "provider_resourceType" "resourceName"{
    attributes
}
*/