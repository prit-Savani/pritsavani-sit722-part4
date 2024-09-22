# Define the Terraform configuration block
terraform {
  # Specify the providers required for this configuration
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"  # Use the AzureRM provider from HashiCorp to manage Azure resources
      version = "~> 3.71.0"  # Specify the version of the AzureRM provider (3.71.0 or later, but less than 4.0)
    }
  }

  # Set the required Terraform version for this configuration
  required_version = ">= 1.5.6"  # The minimum version of Terraform required to run this configuration
}

# Configure the AzureRM provider to interact with Azure
provider "azurerm" {
  features {}  # A placeholder for enabling certain provider-specific features (required, even if empty)
}
