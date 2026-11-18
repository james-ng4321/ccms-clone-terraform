resource "azurerm_mssql_server" "this" {
  name                          = "sql-${local.normalized_prefix}-${local.normalized_suffix}"
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  version                       = "12.0"
  administrator_login           = var.sql_admin_login
  administrator_login_password  = var.sql_admin_password
  minimum_tls_version           = "1.2"
  public_network_access_enabled = false
  tags                          = var.tags
}

resource "azurerm_mssql_database" "this" {
  name        = "sqldb-ccms-clonetest"
  server_id   = azurerm_mssql_server.this.id
  sku_name    = "S0"
  max_size_gb = 10
  tags        = var.tags
}
