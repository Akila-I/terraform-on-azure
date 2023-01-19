# https://developer.hashicorp.com/terraform/language/values/variables

variable "resource_group_name" {
  type = string
  default = "akila_test_rg_2"
}

variable "virtual_network_name" {
  type = string
  default = "akila_test_vnet_1"
}
