resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "datalake" {
  name                     = var.data_lake_name # must be globally unique and 3–24 lowercase letters/numbers
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true  # Key line for Data Lake Gen2

  # Optional: secure settings
  min_tls_version = "TLS1_2"

  tags = {
    environment = "dev"
  }
}
