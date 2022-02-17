# Defined Resource Group
resource "azurerm_resource_group" "resoucegroup" {
  name     =  var.resource_group_name
  location =  var.location
}


# Defined Azure Storage Account

resource "azurerm_storage_account" "storageacc" {
  name                     = var.functionsapp_scname
  resource_group_name      = azurerm_resource_group.resoucegroup.name
  location                 = azurerm_resource_group.resoucegroup.location
  account_tier             = var.tier
  account_replication_type = var.ac_type
}

# Defined Azure Service Plan 

resource "azurerm_app_service_plan" "app-service-plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.resoucegroup.location
  resource_group_name = azurerm_resource_group.resoucegroup.name

  sku {
    tier = var.tier
    size = var.size
  }
}

# Defined Creation Of Function

resource "azurerm_function_app" "functionapp" {
  name                       = var.functionappname
  location                   = azurerm_resource_group.resoucegroup.location
  resource_group_name        = azurerm_resource_group.resoucegroup.name
  app_service_plan_id        = azurerm_app_service_plan.app-service-plan.id
  storage_account_name       = azurerm_storage_account.storageacc.name
  storage_account_access_key = azurerm_storage_account.storageacc.primary_access_key
}