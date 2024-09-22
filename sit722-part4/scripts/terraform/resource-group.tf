# Define an Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.app_name   # Set the name of the resource group, using the app_name variable
  location = var.location   # Set the location (Azure region) for the resource group, using the location variable
}
