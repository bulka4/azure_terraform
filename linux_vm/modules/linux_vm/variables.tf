variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "resource_group_location" {
    type = string
    description = "Name of a location the resource group"
}

variable "vm_size" {
    type = string
    description = <<EOT
        Size of the VM which we will create. I think we need to take name of the VM from the Azure pricing website, add
        the 'Standard_' prefix, and replace spaces with the underscore '_'. So for example if we want to use VM 'DS1 v2'
        then vm_size = 'Standard_DS1_v2'.
    EOT
    default = "Standard_B2ms"
}

variable "vm_name" {
    type = string
    description = "Name of the VM."
    default = "myVM"
}

variable "network_interface_id" {
    type = string
    description = "Network interface ID created by the networks module."
}

variable "username" {
    type = string
    description = "Username used to connect to the created VM using SSH."
    default = "azureadmin"
}

variable "public_key" {
    type = string
    description = "Public key used to connect to the created VM using SSH. It is created by the ssh module."
}

variable "storage_account_uri" {
    type = string
    description = "URI of the storage account for boot diagnostics. It is the primary_blob_endpoint output from the storage_account module."
}

variable "bash_script_location" {
    type = string
    description = "location of the bash script template which will be executed on the VM. That needs to be script of a format .sh.tftpl"
}

variable azure_pipelines_url {
    type = string
    description = <<EOT
        URL of the azure devOps organization of the following format: https://dev.azure.com/<organization-name>.
        It is used to create a Self Hosted Agent in Azure Pipelines.
    EOT
}

variable azure_pipelines_token {
    type = string
    description = "Personall access token to the Azure Pipelines which will be used to create a Self Hosted Agent in Azure Pipelines."
    sensitive = true
}

variable azure_pipelines_pool_name {
    type = string
    description = "Name of the agent pool in Azure Pipelines where we will add the Self Hosted Agent installed on the created VM."
}

variable azure_pipelines_agent_name {
    type = string
    description = "Name of the agent in Azure Pipelines which will be added to the agent pool in Azure Pipelines defined by the previous variable 'pool_name'."
}