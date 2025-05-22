output "primary_access_key" {
    value = azurerm_storage_account.datalake.primary_access_key
    sensitive = true
}