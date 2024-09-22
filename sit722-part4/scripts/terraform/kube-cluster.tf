# Create an Azure Kubernetes Service (AKS) cluster
resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.app_name  # The name of the Kubernetes cluster, pulled from a variable 'app_name'
  location            = var.location  # Location where the Kubernetes cluster will be deployed, pulled from a variable 'location'
  resource_group_name = azurerm_resource_group.rg.name  # The resource group in which the Kubernetes cluster will be created
  dns_prefix          = var.app_name  # DNS prefix for the Kubernetes cluster, used to create unique FQDNs
  kubernetes_version  = var.kubernetes_version  # Version of Kubernetes to deploy, pulled from a variable 'kubernetes_version'

  # Define the default node pool configuration
  default_node_pool {
    name       = "default"  # Name of the node pool
    node_count = 1  # Number of nodes in the pool, set to 1 for minimal cluster
    vm_size    = "Standard_B2s"  # The size of the virtual machines (VMs) for the nodes, "Standard_B2s" is a small, cost-effective option
  }

  # Enable system-assigned managed identity for the cluster
  identity {
    type = "SystemAssigned"  # Automatically assigns a managed identity to the Kubernetes cluster
  }
}

# Assign the 'AcrPull' role to the AKS cluster, allowing it to pull images from Azure Container Registry (ACR)
resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id  # The identity of the AKS cluster that will pull images from ACR
  role_definition_name             = "AcrPull"  # Assign the 'AcrPull' role to allow the AKS cluster to pull container images from the ACR
  scope                            = azurerm_container_registry.container_registry.id  # The scope of the role assignment is the ACR, so the AKS cluster can pull images from this registry
  skip_service_principal_aad_check = true  # Skips the Azure Active Directory check for service principals, allowing the role assignment without additional validation
}
