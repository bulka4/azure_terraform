variable "schema_name" {
    type = string
    description = "Name of the schema we want to create"
}

variable "catalog_id" {
    type = string
    description = "Terraform ID of the catalog in which we want to create the specified schema."
}

variable "group_name" {
    type = string
    description = "Name of the user group in Entra ID for which we want to define privileges."
}