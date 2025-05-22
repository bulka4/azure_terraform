resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = "12.0"
  administrator_login          = var.sql_server_username
  administrator_login_password = var.sql_server_password
}

resource "azurerm_sql_database" "sqldb" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  server_name         = azurerm_mssql_server.sqlserver.name
}
