variable "resource_group_location" {
  type        = string
  description = "Location of the resource group where we will create the databricks workspace."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where we will create the databricks workspace."
}

variable "workspace_name" {
  type = string
  description = "Name of the databricks workspace."
}

variable "managed_resource_group_name" {
  type = string
  description = "Name of the managed_resource_group_name for databricks."
}