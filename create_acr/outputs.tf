output sp_id {
  value = module.service_principal.client_id
  description = "Service Principal app ID"
}

output sp_password {
  value = module.service_principal.client_password
  sensitive = true
  description = "Service Principal password"
}