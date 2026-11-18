resource "azurerm_container_registry" "this" {
  name                = local.acr_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  sku           = "Basic"
  admin_enabled = false

  tags = var.tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope = azurerm_container_registry.this.id

  role_definition_name = "AcrPull"

  principal_id = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}