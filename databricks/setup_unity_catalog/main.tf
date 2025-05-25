/*
module "resource_group" {
  source = "../modules/resource_group"
  
  name = var.resource_group_name # default = "databricks"
  location = var.resource_group_location # default = "westeurope"
}
*/

# Create a metastore for the Unity Catalog.
module "metastore" {
    source = "../modules/metastore"

    location = var.resource_group_location # default = "westeurope"
}


# Link the created workspace to the created metastore.
module "link_workspace_to_metastore" {
    source = "../modules/metastore"

    databricks_workspace_id = var.workspace_id
    metastore_id = modules.metastore.outputs.metastore_id
}


# Create a user group in Entra ID and add users to it. It will be used for managing permissions
# in the Unity Catalog.
module "user_groups" {
  source = "../modules/user_groups"

  group_name = var.group_name # default = "Data Engineers"
  group_members_emails = var.group_members_emails
}


# Create a storage account and container which will be used for storing data for external and managed tables in the Unity Catalog.
module "storage_account" {
  source = "../modules/storage_account"

  resource_grup_name = var.resource_group_name # default = "databricks"
  resource_grup_location = var.resource_group_location

  storage_account_name = var.storage_account_name # default = "extstorage"
  container_name = var.container_name # default = "ext"
}


# Create an external location linked to the storage account and container created before. 
module "external_location" {
  source = "../modules/external_location"

  resource_grup_name = var.resource_group_name
  resource_grup_location = var.resource_group_location

  access_connector_name = var.access_connector_name # default = "databricks-ext-storage"
  external_location_name = var.external_location_name # default = "ext"
  storage_account_id = modules.storage_account.outputs.storage_account_id
  container_name = var.container_name
  group_name = var.group_name # default = "Data Engineers"

  depends_on = [module.link_workspace_to_metastore]
}


# Create a catalog in the Unity Catalog
module "catalog" {
  source = "../modules/catalog"

  catalog_name = var.catalog_name # default = "db"
  storage_account_name = var.storage_account_name
  container_name = var.container_name
  group_name = var.group_name # default = "Data Engineers"

  depends_on = [module.link_workspace_to_metastore]
}


# Create a schema in the catalog created before in the Unity Catalog
module "schema" {
  source = "../modules/schema"

  schema_name = var.schema_name # default = "dbi"
  catalog_id = modules.catalog.outputs.catalog_id
  group_name = var.group_name # default = "Data Engineers"

  depends_on = [module.catalog]
}


# Create a cluster 
module "clusters" {
  source = "../modules/clusters"

  # need to wait until the metastore is assigned
  depends_on = [module.link_workspace_to_metastore]
}