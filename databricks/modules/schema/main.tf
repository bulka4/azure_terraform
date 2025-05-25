# Create a schema in the catalog created previously.
resource "databricks_schema" "this" {
  catalog_name = var.catalog_id
  name         = var.schema_name
  comment      = "this database is managed by terraform"
  properties = {
    kind = "various"
  }
}

# grant priviliges to a specific Entra ID user group so they can used the specified schema for a specific purposes only.
resource "databricks_grants" "this" {
  schema = databricks_schema.this.id
  grant {
    principal  = var.group_name
    privileges = ["USE_SCHEMA"]
  }
}