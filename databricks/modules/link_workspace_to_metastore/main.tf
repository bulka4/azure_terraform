# link a databricks workspace to the created metastore
resource "databricks_metastore_assignment" "this" {
  provider             = databricks.accounts
  workspace_id         = var.databricks_workspace_id
  metastore_id         = var.metastore_id
}