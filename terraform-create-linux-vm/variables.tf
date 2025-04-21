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
  description = "Path to the folder where ssh key should be saved"
  default     = "C:/Users/mbulka/.ssh/id_rsa"
}

variable azure_pipelines_token {
  type        = string
  description = "Personall access token to the Azure devOps. It will be used to create a self hosted agent on the created VM."
  sensitive     = true
}