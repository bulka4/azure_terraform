variable "resource_group_location" {
  type        = string
  description = "Location of the resource group where we will create the databricks workspace."
  default = "westeurope"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where we will create the databricks workspace."
  default = "databricks"
}

variable "workspace_id" {
  type = string
  description = <<EOT
    Terraform ID of the databricks workspace which we want to link to the created Unity Catalog. It can be obtained
    from Terraform outputs from the create_workspace module.
  EOT
}

variable "group_name" {
    type = string
    description = "Name of the user group which we will create. It will be used for managing permissions in Unity Catalog."
    default = "Data Engineers"
}

variable "group_members_emails" {
  type    = list(string)
  description = "A list of users emails who should belong to the created user group. Those are user principal names from Entra ID."
}

variable "storage_account_name" {
  type    = string
  description = "Name of the storage account which will be used for storing data for external and managed tables in the Unity Catalog."
  default = "extstorage"
}

variable "container_name" {
  type    = string
  description = "Name of the container which will be used for storing data for external and managed tables in the Unity Catalog"
  default = "ext"
}

variable "access_connector_name" {
  type = string
  description = "Name of the Databricks access connector."
  default = "databricks-ext-storage"
}

variable "external_location_name" {
  type = string
  description = "Name of the external location."
  default = "ext"
}

variable "catalog_name" {
  type = string
  description = "Name of the catalog we will create in the Unity Catalog."
  default = "db"
}

variable "schema_name" {
    type = string
    description = "Name of the schema we want to create"
    default = "dbi"
}