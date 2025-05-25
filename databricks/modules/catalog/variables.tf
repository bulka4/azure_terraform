variable "catalog_name" {
    type = string
    description = "Name of the catalog we want to create."
}

variable "storage_account_name" {
    type = string
    description = "Name of the storage account which will be storing data from the created catalog."
}

variable "container_name" {
    type = string
    description = "Name of the container which will be storing data from the created catalog."
}

variable "group_name" {
    type = string
    description = "Name of the user group in Entra ID for which we will define permissions."
}