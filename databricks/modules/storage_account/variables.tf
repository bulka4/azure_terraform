variable "resource_grup_name" {
    type = string
    description = "Name of the resource group where to create a storage account."
}

variable "resource_group_location" {
    type = string
    description = "Location of the resource group where to create a storage account."
}

variable "storage_account_name" {
    type = string
    description = "Name of the storage account to create."
}

variable "container_name" {
    type = string
    description = "Name of the container to create."
}