output "DevSubnet" {
  description = "Dev subnet id"
  value = azurerm_subnet.test_subnet_2_DEV.id
}

output "ProdSubnet" {
  description = "Prod subnet id"
  value = azurerm_subnet.test_subnet_1_PROD.id
  
}

output "StageSubnet" {
  description = "Stage subnet id"
  value = azurerm_subnet.test_subnet_3_STAGE.id
  
}