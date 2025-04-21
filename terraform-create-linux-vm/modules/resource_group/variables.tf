variable "name_prefix" {
    type = string
    description = "Name prefix of the resource group. We will add to that prefix a random string when creating a resource group."
}

variable "location" {
    type = string
    description = "Name of the location of the resource group"
}