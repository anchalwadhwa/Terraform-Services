# Module Appservice Start

module "app-service" {
    source = "./module/app-service" # Getting Path of Appservice Module
    resource_group_name                    = var.resource_group_name
    location                               = var.location   
    app_service_plan_name                  = var.app_service_plan_name  
    tier                                   = var.tier
    size                                   = var.size
    appservicename                         = var.appservicename
}

# Module Appservice End

# Functionapp Module Start 

module "function-app" {
  source = "./module/function-app"
resource_group_name                    = var.resource_group_name
location                               = var.location 
functionsapp_scname                    = var.functionsapp_scname
tier                                   = var.tier
ac_type                                = var.ac_type
size                                   = var.size
app_service_plan_name                  = var.app_service_plan_name
functionappname                        = var.functionappname
}
# Functionapp Module End