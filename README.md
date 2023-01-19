# Terraform to provison resources on Azure cloud

## [Install Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)

- MacOS
```
brew tap hashicorp/tap

brew install hashicorp/tap/terraform
```

- Linux
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

- Windows

    - Download the binary from the [official site](www.terraform.io)

    - Set the Path Variable accordingly

## [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli) (used by terraform backend)

- MacOS
```
brew update && brew install azure-cli
```

- Linux
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

- Windows

    - Download and install from the [official site](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)


## Azure Authentication (using Azure CLI)

```
az login
az account set --subscription <SUBSCRIPTION_ID>
```