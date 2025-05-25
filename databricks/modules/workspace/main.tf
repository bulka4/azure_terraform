resource "azurerm_databricks_workspace" "this" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "premium"  # options: standard, premium, trial. We need premium in order to use the Unity Catalog.

  managed_resource_group_name = var.managed_resource_group_name
}