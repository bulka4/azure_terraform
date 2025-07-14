# Location of the created resource group
resource_group_location = "westeurope"

# name of the created resource group.
resource_group_name = "data_engineering_apps_acr" 

# name of the created ACR (without special characters. Uppercase letters allowed.)
acr_name = "dataEngineeringApps" 

# name of the created service principal which will be used for authentication when pushing and pulling images from ACR
service_principal_display_name = "data_engineering_apps_acr" 

# role which we want to assign to the created service principal ("acrpush" will allow for both pushing and pulling images to the ACR)
service_principal_role = "acrpush" 