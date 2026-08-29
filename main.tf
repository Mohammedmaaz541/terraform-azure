

module "resource_group" {
  source = "./modules/resource-group"

  location = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

module "network" {
  source = "./modules/network"

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefixes     = var.subnet_prefixes
  tags                = var.tags
}

module "vm" {
  source = "./modules/vm"

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  vm_size             = var.vm_size
  os_disk_size_gb     = var.os_disk_size_gb
  tags                = var.tags
}
