variable "resource_group_location" {
  type        = string
  description = "Location of the resource group where we will create sql db."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where we will create sql db."
}

variable "data_lake_name" {
  type        = string
  description = "Name of the data lake."
}