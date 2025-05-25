variable "resource_group_name" {
  type = string
  description = "Name of the resource group in which we want to create the Databricks access connector."
}

variable "resource_group_location" {
  type = string
  description = "Location of the resource group in which we want to create the Databricks access connector."
}

variable "access_connector_name" {
  type = string
  description = "Name of the Databricks access connector we will create."
}

variable "external_location_name" {
  type = string
  description = "Name of the external location which we will create."
}

variable "storage_account_id" {
  type = string
  description = "ID of the storage account which will be linked to the created external location. It is the 'id' value from the azurerm_storage_account resource."
}

variable "container_name" {
  type = string
  description = "Name of the container in the storage account specified above which will be linked to the created external location."
}

variable "group_name" {
    type = string
    description = "Name of the user group in Entra ID for which we will define permissions."
}