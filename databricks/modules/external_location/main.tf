# find storage account based on its ID
data "azurerm_storage_account" "this" {
  id = var.storage_account_id
}


# Create a databricks access connector which provides a system assigned Azure Managed Identity. This Identity will 
# be used by Databricks to authenticate when connecting to the storage account provided in variables.
resource "azurerm_databricks_access_connector" "ext_access_connector" {
  name                = var.access_connector_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  identity {
    type = "SystemAssigned"
  }
}

# assign proper roles to the Managed Identity provided by the access connector created before.
# Those roles are needed in order to access a storage account.
resource "azurerm_role_assignment" "blob_data_contributor" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_databricks_access_connector.ext_access_connector.identity[0].principal_id
}

resource "azurerm_role_assignment" "queue_data_contributor" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = azurerm_databricks_access_connector.ext_access_connector.identity[0].principal_id
}

# Create a Storage Credential which will be used by Databricks to access the storage account provided in variables.
# This references the Access Connector created above, which includes the managed identity with proper permissions.
resource "databricks_storage_credential" "external" {
  name = azurerm_databricks_access_connector.ext_access_connector.name
  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.ext_access_connector.id
  }
  comment = "Managed by TF"
  # depends_on = [
  #   databricks_metastore_assignment.this
  # ]
}

# grant priviliges to a specific Entra ID user group so they can use the specified storage credential for a specific purposes only.
resource "databricks_grants" "external_creds" {
  storage_credential = databricks_storage_credential.external.id
  grant {
    principal  = var.group_name
    privileges = ["CREATE_EXTERNAL_TABLE"]
  }
}

# Create an external location that maps a specified name to a path in the storage account provided in variables.
# This location can be used for creating external tables that reference data in that storage account.
resource "databricks_external_location" "some" {
  name = var.external_location_name
  url = format("abfss://%s@%s.dfs.core.windows.net",
    var.container_name,
    data.azurerm_storage_account.this.name
  )
  credential_name = databricks_storage_credential.external.id
  comment         = "Managed by TF"
  # depends_on = [
  #   databricks_metastore_assignment.this
  # ]
}

# grant priviliges to a specific Entra ID user group so they can use the specified external location for a specific purposes only.
resource "databricks_grants" "some" {
  external_location = databricks_external_location.some.id
  grant {
    principal  = var.group_name
    privileges = ["CREATE_EXTERNAL_TABLE", "READ_FILES"]
  }
}