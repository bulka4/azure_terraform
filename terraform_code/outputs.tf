output "resource_group_name" {
  value = module.resource_group.name
}

output "public_ip_address" {
  value = module.linux_vm.public_ip_address
}

output "vm_username" {
  value = var.vm_username
}