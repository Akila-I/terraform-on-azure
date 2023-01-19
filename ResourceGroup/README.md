# Azure Provider

- Official provider by hashcorp
- [Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/3.39.1)


## Authenticating

- Using Azure CLI (when running terraform locally) [Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli)
- Manage Identity [Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/managed_service_identity)
- Service Principal with Client Certificate [Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_certificate)
- Service Principal with Client Secret [Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)

## Azure Resource Group Block

```
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}
```
Terraform Commands
```
terraform init

terraform plan

terraform apply
```
to remove the deployed resource : 
```
terraform destroy
```