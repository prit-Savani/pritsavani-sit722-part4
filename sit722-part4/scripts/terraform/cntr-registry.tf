# Create an Azure Container Registry resource
resource "azurerm_container_registry" "container_registry" {
  name                = var.app_name  # The name of the container registry, pulled from a variable 'app_name'
  resource_group_name = azurerm_resource_group.rg.name  # The name of the resource group where the registry will be created, referencing the resource group created earlier
  location            = var.location  # Location where the container registry will be deployed, pulled from a variable 'location'
  admin_enabled       = true  # Enables the admin account for the registry, allowing push/pull operations without Azure AD authentication
  sku                 = "Basic"  # The SKU tier for the registry, "Basic" is the lowest-cost option
}
