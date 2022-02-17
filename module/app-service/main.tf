# Defined Resource Group

resource "azurerm_resource_group" "resouce-group" {
  name     = var.resource_group_name
  location = var.location
}

# Defined Azure Service Plan 

resource "azurerm_app_service_plan" "app-service-plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.resouce-group.location
  resource_group_name = azurerm_resource_group.resouce-group.name

  sku {
    tier = var.tier
    size = var.size
  }
}

# Defined Creation Of Azureapp Service

resource "azurerm_app_service" "appservice" {
  name                = var.appservicename
  location            = azurerm_resource_group.resouce-group.location
  resource_group_name = azurerm_resource_group.resouce-group.name
  app_service_plan_id = azurerm_app_service_plan.app-service-plan.id
}