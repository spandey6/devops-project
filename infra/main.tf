terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azureerm = {
      source = "hashicorp/azureerm"
      version = "~> 4.0"
    }
  }
}
provider "azurerm"{
  feature {}
}

# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name = "rg-hello-world-dev"
  location = "eastus"
}

# 2. App Service
resource "azurerm_service_plan" "asp" {
  name                = "asp-hello-world-dev"
  location            = "azurerm_resource_group.rg.location"
  resource_group_name = "azurerm_resource_group.rg.name"
  os_type             = "Linux"
  sku_name            = "B1"
}

# 3. App Service
resource "azurerm_linux_web_app" "app" {
  name                = "hello-world-webapp-dev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
    node_version = "18-Its"
    }
  }
  app_setting = {
    "WEBSITE_RUN_FROM_PACKAGE" = "0"
  }
}
output "app_url" {
  value = azurerm_linux_web_app.app.default_hostname
}
