resource "azurerm_service_plan" "main" {
  name                = module.naming.app_service_plan.name
  location            = var.application_metadata.location
  resource_group_name = var.resource_group_name
  sku_name            = var.webapp.sku_name
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "main" {
  name                = module.naming.app_service.name
  service_plan_id     = azurerm_service_plan.main.id
  location            = var.application_metadata.location
  resource_group_name = var.resource_group_name

  site_config {
    application_stack {
      docker_image_name = var.container.image
    }
  }

  app_settings = {
    "AppName" = "Demo app"
  }
}