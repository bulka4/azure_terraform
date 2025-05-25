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

variable "managed_resource_group_name" {
  type = string
  description = "Name of the managed_resource_group_name for databricks."
  default = "databricks_managed_rg"
}

variable "workspace_name" {
  type = string
  description = "Name of the databricks workspace."
  default = "workspace"
}