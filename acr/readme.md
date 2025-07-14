# Preparing Terraform variables
We need to create the terraform.tfvars file in the same folder as this readme file and specify there values for the following variables:
- resource_group_location - Location of the created resource group, for example "westeurope"
- resource_group_name - name of the created resource group.
- acr_name - name of the created ACR (without special characters. Uppercase letters allowed.)
- service_principal_display_name - name of the created service principal which will be used for authentication when pushing and pulling images from ACR (underscores allowed)
- service_principal_role - role which we want to assign to the created service principal ("acrpush" will allow for both pushing and pulling images to the ACR)