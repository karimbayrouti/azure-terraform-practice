terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = "rg-networking-practice"
  location = var.location

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_resource_group" "rg2" {
  name     = "rg-frontend-practice"
  location = var.location

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_service_plan" "frontend_plan" {
  name                = "asp-shipping-frontend"
  resource_group_name = azurerm_resource_group.rg2.name
  location            = var.location2
  os_type             = "Linux"
  sku_name            = "B1"

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_linux_web_app" "frontend" {
  name                = "app-shipping-frontend"
  resource_group_name = azurerm_resource_group.rg2.name
  location            = var.location2
  service_plan_id     = azurerm_service_plan.frontend_plan.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-practice"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_subnet" "snet-frontend" {
  name                 = "snet-frontend"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}