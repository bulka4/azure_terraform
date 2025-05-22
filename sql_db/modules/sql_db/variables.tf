variable "resource_group_location" {
  type        = string
  description = "Location of the resource group where we will create sql db."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where we will create sql db."
}

variable "sql_server_name" {
  type        = string
  description = "Name of the sql server which we will create."
}

variable "sql_server_username" {
  type        = string
  description = "Name of the sql server which we will create."
}

variable "sql_server_password" {
  type        = string
  description = "Name of the sql server which we will create."
}

variable "database_name" {
  type        = string
  description = "Name of the databse which we will create in the sql server."
}