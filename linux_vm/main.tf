module "resource_group" {
  source = "./modules/resource_group"
  name = var.resource_group_name
  location = var.resource_group_location
}

module "networks" {
  source = "./modules/networks"
  resource_group_name = module.resource_group.name
  resource_group_location = module.resource_group.location
}

module "ssh"{
  source = "./modules/ssh"
  resource_group_id = module.resource_group.id
  resource_group_location = module.resource_group.location
  ssh_folder = var.ssh_folder
}

module "storage_account" {
  source = "./modules/storage_account"
  resource_group_name = module.resource_group.name
  resource_group_location = module.resource_group.location
}

module "linux_vm" {
  source = "./modules/linux_vm"
  
  resource_group_name = module.resource_group.name
  resource_group_location = module.resource_group.location

  network_interface_id = module.networks.network_interface_id

  username = var.vm_username
  public_key = module.ssh.public_key

  storage_account_uri = module.storage_account.primary_blob_endpoint

  bash_script_location = "modules/linux_vm/install_tools.sh.tftpl" # location of the bash script which will be executed on the VM.

  azure_pipelines_url = var.azure_pipelines_url
  azure_pipelines_token = var.azure_pipelines_token
  azure_pipelines_pool_name = var.azure_pipelines_pool_name
  azure_pipelines_agent_name = var.azure_pipelines_agent_name
}