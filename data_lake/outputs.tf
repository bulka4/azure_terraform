output "primary_access_key" {
    value = module.data_lake.primary_access_key
    sensitive = true
}