resource "azurerm_container_group" "main" {
  name                = module.naming.container_group.name
  dns_name_label      = module.naming.container_group.name
  location            = var.application_metadata.location
  resource_group_name = var.resource_group_name
  os_type             = var.container.os_type
  ip_address_type     = "Public"

  container {
    name   = var.container.name
    image  = var.container.image
    cpu    = var.container.cpu
    memory = var.container.memory

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}