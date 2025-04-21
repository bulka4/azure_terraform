variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "data_engineering_apps"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "vm_username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}

variable "ssh_folder" {
  type        = string
  description = "Path to the folder where ssh key should be saved. On Windows the default one is C:/Users/<username>/.ssh/id_rsa. It is the easiest to use."
}

variable azure_pipelines_url {
  type = string
  description = "URL of the Azure devOps organization which we will be using. It has the following format: https://dev.azure.com/<organization_name>"
}

variable azure_pipelines_token {
  type        = string
  description = <<EOT
    Personall access token to the Azure devOps. It will be used to create a self hosted agent on the created VM. 
    It needs to be defined in the terraform.tfvars file.
  EOT
  sensitive     = true
}