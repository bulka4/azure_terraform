module "resource_group" {
  source = "./modules/resource_group"
  name = var.resource_group_name
  location = var.resource_group_location
}

module "acr" {
  source = "./modules/container_registry"
  acr_name                = var.acr_name
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "service_principal" {
  source = "./modules/service_principal"
  service_principal_display_name = var.service_principal_display_name
  scope = module.acr.id
  role = var.service_principal_role
}