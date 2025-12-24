#Resource Group
resource "azurerm_resource_group" "HCL" {
  name     = "HCL-rg"
  location = "West Europe"
}

#ACS Registry
resource "azurerm_container_registry" "acr" {
  name                = "HCLACR"
  resource_group_name = azurerm_resource_group.HCL.name
  location            = azurerm_resource_group.HCL.location
  sku                 = "Premium"
  admin_enabled       = false
}

#AKS Cluster
resource "azurerm_kubernetes_cluster" "AKS" {
  name                = "HCL-AKS"
  location            = azurerm_resource_group.HCL.location
  resource_group_name = azurerm_resource_group.HCL.name
  dns_prefix          = "HCL"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_d2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

}
