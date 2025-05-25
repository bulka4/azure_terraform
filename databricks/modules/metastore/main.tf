# Create a Unity Catalog metastore
resource "databricks_metastore" "this" {
  provider      = databricks.accounts
  name          = "primary"
  force_destroy = true
  region        = var.location
}