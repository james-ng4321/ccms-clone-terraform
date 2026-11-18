resource "azurerm_kubernetes_cluster" "this" {
  name                = "aks-${local.base_name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "aks-${local.normalized_prefix}-${local.normalized_suffix}"

  sku_tier = "Free"

  workload_identity_enabled = true
  oidc_issuer_enabled       = true

  default_node_pool {
    name = "system"
    # node_count     = var.aks_node_count
    vm_size              = var.aks_node_vm_size
    vnet_subnet_id       = azurerm_subnet.aks.id
    auto_scaling_enabled = true

    min_count = var.aks_min_node_count
    max_count = var.aks_max_node_count
  }

  identity {
    type = "SystemAssigned"
  }

  ingress_application_gateway {
    gateway_id = azurerm_application_gateway.this.id
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    service_cidr      = "10.41.0.0/16"
    dns_service_ip    = "10.41.0.10"
  }

  #oms_agent {
  #  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
  #}

  tags = var.tags
}
