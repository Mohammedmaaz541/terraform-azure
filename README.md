# Terraform Azure Infrastructure

This project provisions a simple Azure environment using Terraform modules for:

- Resource Group
- Virtual Network and Subnet
- Windows Virtual Machine

## Project Structure

```text
terraform-azure/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── provider.tf
├── backend.tf
├── README.md
└── modules/
    ├── resource-group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── network/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── vm/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Prerequisites

Before running this Terraform code, make sure you have:

- Azure CLI installed and logged in
- Terraform installed
- An Azure subscription
- A storage account and container for remote state if you plan to use the backend configuration

## Azure Login

Run the following command to authenticate with Azure:

```bash
az login
```

If needed, set the correct subscription:

```bash
az account set --subscription "<your-subscription-id-or-name>"
```

## Configure Variables

Update the values in [terraform.tfvars](terraform.tfvars) to match your environment:

```hcl
location            = "eastus"
resource_group_name = "rg-demo"
vnet_name           = "vnet-demo"
address_space       = ["10.0.0.0/16"]
subnet_name         = "subnet-demo"
subnet_prefixes     = ["10.0.1.0/24"]
vm_name             = "vm-demo"
admin_username      = "azureuser"
admin_password      = "P@ssw0rd1234!"
vm_size             = "Standard_B2s"
os_disk_size_gb     = 128
```

## Backend Configuration

The backend is configured in [backend.tf](backend.tf). Replace the placeholder values with your own Azure Storage account settings:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate123"
    container_name       = "tfstate"
    key                  = "terraform-azure.tfstate"
  }
}
```

If you prefer local state instead of remote state, remove or comment out the backend block.

## Initialize Terraform

```bash
terraform init
```

## Validate the Configuration

```bash
terraform validate
```

## Preview the Deployment

```bash
terraform plan
```

## Apply the Infrastructure

```bash
terraform apply
```

When prompted, confirm the deployment by typing `yes`.

## Destroy the Infrastructure

```bash
terraform destroy
```

## Notes

- The password is marked as sensitive in the variables.
- The VM uses a Windows Server image by default.
- The project is structured as reusable Terraform modules for easier maintenance and scaling.

## Useful Commands

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```
