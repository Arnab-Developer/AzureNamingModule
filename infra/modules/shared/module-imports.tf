module "naming" {
  source = "Azure/naming/azurerm"
  suffix = [var.application_metadata.name, var.application_metadata.environment]
}