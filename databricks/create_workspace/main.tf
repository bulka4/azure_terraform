module "resource_group" {
  source = "../modules/resource_group"
  
  name = var.resource_group_name # default = "databricks"
  location = var.resource_group_location # default = "westeurope"
}


# Create a databricks workspace. It might take a lot of time (around 15 min)
module "workspace" {
    source = "../modules/workspace"

    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location
    managed_resource_group_name = var.managed_resource_group_name # default = "databricks_managed_rg"

    workspace_name = var.workspace_name # default = "workspace"

    depends_on = [module.resource_group]
}