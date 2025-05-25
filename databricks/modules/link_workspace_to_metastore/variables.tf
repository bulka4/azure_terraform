variable "databricks_workspace_id" {
  type = string
  description = "Terraform ID of the databricks workspace which we want to link to a metastore. It can be obained from the 'workspace' module outputs."
}

variable "metastore_id" {
    type = string
    description = "Terraform ID of the metastore to which we want to link a given workspace. It can be obained from the 'metastore' module outputs."
}