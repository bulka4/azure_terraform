# Create a Linux VM.
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = var.vm_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_id]
  size                  = var.vm_size

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "hostname"
  admin_username = var.username

  admin_ssh_key {
    username   = var.username
    public_key = var.public_key
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}

# Render the bash script template which will be executed on the VM.
locals {
  rendered_script = templatefile("${var.bash_script_location}", {
    username   = var.username
    url        = var.azure_pipelines_url
    token      = var.azure_pipelines_token
    pool_name  = var.azure_pipelines_pool_name
    agent_name = var.azure_pipelines_agent_name
  })
}

# execute commands on the VM after creating it. They will install Docker and Azure Pipelines self hosted agent.
resource "azurerm_virtual_machine_extension" "my_terraform_vm_extension" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_linux_virtual_machine.my_terraform_vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = jsonencode({
    script = base64encode(local.rendered_script)
  })

}
