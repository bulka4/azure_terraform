# Preparing Terraform variables
We need to create the terraform.tfvars file in the same folder as this readme file and specify there values for the following variables:
- resource_group_location - Location of the created resource group, for example "westeurope"
- resource_group_name - name of the created resource group.
- data_lake_name - name of the created data lake (without any special characters or uppercase letters. It needs to be globally unique).