variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group where we will create acr."
}

variable "resource_group_name" {
  type        = string
  default     = "data_engineering_apps_acr"
  description = "Name of the resource group where we will create acr."
}

variable acr_name {
    type = string
    description = "Name of the container registry"
    default = "dataEngineeringApps"
}