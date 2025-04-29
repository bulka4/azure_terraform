variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "vm_username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
}

variable "ssh_folder" {
  type        = string
  description = "Path to the folder where ssh key should be saved. On Windows the default one is C:/Users/<username>/.ssh/id_rsa. It is the easiest to use."
}


# Below variables starting with 'azure_pipelines_' are needed in order to install an Azure Pipelines Self Hosted Agent on the created VM.

variable azure_pipelines_url {
  type = string
  description = "URL of the Azure devOps organization which we will be using. It has the following format: https://dev.azure.com/<organization_name>"
}

variable azure_pipelines_token {
  type        = string
  description = "Personall access token to the Azure devOps."
  sensitive   = true
}

variable azure_pipelines_pool_name {
  type = string
  description = "Name of the Agent pool to which we will add created Agent."
}

variable azure_pipelines_agent_name {
  type = string
  description = "Name of the Agent that we will create."
}