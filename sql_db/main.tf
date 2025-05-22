module "resource_group" {
  source = "./modules/resource_group"
  
  name = var.resource_group_name
  location = var.resource_group_location
}

module "sql_db" {
    source = "./modules/sql_db"

    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location

    sql_server_name = var.sql_server_name
    sql_server_username = var.sql_server_username
    sql_server_password = var.sql_server_password

    database_name = var.database_name
}