output "resource_group_name" {
  description = "Created resource group name."
  value       = azurerm_resource_group.this.name
}

output "storage_account_names" {
  description = "Created storage account names."
  value       = sort([for account in azurerm_storage_account.this : account.name])
}

output "aks_cluster_name" {
  description = "Created AKS cluster name."
  value       = azurerm_kubernetes_cluster.this.name
}

output "sql_server_fqdn" {
  description = "Azure SQL logical server FQDN."
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}

output "key_vault_name" {
  description = "Created Key Vault name."
  value       = azurerm_key_vault.this.name
}

output "application_gateway_public_ip" {
  description = "Application Gateway public IP address."
  value       = azurerm_public_ip.appgw.ip_address
}

output "acr_name" {
  value = azurerm_container_registry.this.name
}

output "acr_login_server" {
  value = azurerm_container_registry.this.login_server
}