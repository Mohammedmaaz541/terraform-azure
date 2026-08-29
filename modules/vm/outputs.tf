output "vm_id" {
  description = "ID of the Windows VM"
  value       = azurerm_windows_virtual_machine.vm.id
}

output "nic_id" {
  description = "ID of the NIC"
  value       = azurerm_network_interface.nic.id
}
