resource "azurerm_api_management" "this" {
  name                = var.apim_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  publisher_name  = var.apim_publisher_name
  publisher_email = var.apim_publisher_email

  sku_name = var.apim_sku_name

  tags = var.tags
}
