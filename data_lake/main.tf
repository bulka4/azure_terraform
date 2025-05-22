module "resource_group" {
  source = "./modules/resource_group"
  
  name = var.resource_group_name
  location = var.resource_group_location
}

module "data_lake" {
    source = "./modules/data_lake"

    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location

    data_lake_name = var.data_lake_name
}