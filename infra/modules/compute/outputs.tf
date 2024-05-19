output "container" {
  value = {
    container_website_url = azurerm_container_group.main.fqdn
    webapp_website_url    = azurerm_linux_web_app.main.default_hostname
  }
}