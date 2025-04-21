resource "random_pet" "rg_name" {
  prefix = var.name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = random_pet.rg_name.id
}