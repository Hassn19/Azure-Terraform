resource "azurerm_app_service_plan" "plan" {
  name                  = "${var.name}-plan"
  location              = var.location
  resource_group_name   =  var.resource_group_name
  kind                  = "Linux"
  reserved              = true
  
  sku {
        tier = "Basic"
        size = "B1"
    }
   tags = var.tags
}

resource "azurerm_app_service" "app" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  app_service_plan_id   = azurerm_app_service_plan.plan.id 

  site_config {
    linux_fx_version = "PYTHON|3.10" #change for node.js or other language etc... 
  }

  tags = var.tags
}