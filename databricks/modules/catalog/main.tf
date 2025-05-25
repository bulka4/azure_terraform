# Create a catalog in the Unity Catalog. When we will be creating managed tables in this catalog their data
# will be saved in the storage account given by the storage_root argument, that is the and container created previously.
resource "databricks_catalog" "this" {
  name = var.catalog_name
  storage_root = format("abfss://%s@%s.dfs.core.windows.net",
    var.container_name,
    var.storage_account_name)
  comment = "this catalog is managed by terraform"
  properties = {
    purpose = "testing"
  }
  depends_on = [databricks_metastore_assignment.default_metastore]
}

# grant priviliges to a specific Entra ID user group so they can used the specified catalog for a specific purposes only.
resource "databricks_grants" "this" {
  catalog = databricks_catalog.this.name
  grant {
    principal  = var.group_name
    privileges = ["USE_CATALOG", "CREATE"]
  }
}