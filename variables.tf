variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-demo"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    environment = "dev"
    project     = "terraform-azure"
  }
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-demo"
}

variable "address_space" {
  description = "CIDR blocks for virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet-demo"
}

variable "subnet_prefixes" {
  description = "CIDR blocks for subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "vm-demo"
}

variable "admin_username" {
  description = "VM admin username"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "VM admin password"
  type        = string
  default     = "P@ssw0rd1234!"
  sensitive   = true
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 128
}
