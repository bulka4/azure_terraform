resource "random_string" "acr_name" {
  length  = 5
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "azurerm_container_registry" "example" {
  name                = "${random_string.acr_name.result}registry"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Standard"
}