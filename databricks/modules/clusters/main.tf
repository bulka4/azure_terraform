data "databricks_spark_version" "latest" {
  provider = databricks.workspace
}
data "databricks_node_type" "smallest" {
  provider   = databricks.workspace
  local_disk = true
}

# set up a compute cluster for executing code from notebooks.
resource "databricks_cluster" "unity_shared" {
  provider                = databricks.workspace
  cluster_name            = "Shared clusters"
  spark_version           = data.databricks_spark_version.latest.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 60
  num_workers             = 2
  azure_attributes {
    availability = "SPOT"
  }
  data_security_mode = "USER_ISOLATION"
}