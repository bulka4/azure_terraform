variable "resource_group_location" {
  type        = string
  description = "Location of the resource group where we will create acr."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where we will create acr."
}

variable acr_name {
    type = string
    description = "Name of the container registry."
}

variable service_principal_display_name {
  type = string
  description = "Name of the Service Principal."
}

variable service_principal_role {
  type = string
  description = <<EOF
    Role assigned to the created Service Principal. The 'acrpush' role will allow for both pushing and pulling images to ACR.
    The 'pull' role allow only for pulling.
  EOF
}