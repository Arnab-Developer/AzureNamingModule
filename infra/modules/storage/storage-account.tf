resource "azurerm_storage_account" "main" {
  name                     = module.naming.storage_account.name
  account_tier             = var.storage_account.type
  account_replication_type = var.storage_account.replication_type
  resource_group_name      = var.resource_group_name
  location                 = var.application_metadata.location

  static_website {
    index_document     = "index.html"
    error_404_document = "error.html"
  }
}

resource "azurerm_storage_blob" "home_page" {
  name                   = "index.html"
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  storage_account_name   = azurerm_storage_account.main.name
  source                 = var.static_website.home_page
}

resource "azurerm_storage_blob" "error_page" {
  name                   = "error.html"
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  storage_account_name   = azurerm_storage_account.main.name
  source                 = var.static_website.error_page
}