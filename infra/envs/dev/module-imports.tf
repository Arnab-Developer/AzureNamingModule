module "shared" {
  source               = "../../modules/shared"
  application_metadata = local.application_metadata
}

module "compute" {
  source               = "../../modules/compute"
  resource_group_name  = module.shared.resource_group_name
  application_metadata = local.application_metadata

  container = {
    name    = "hello-world"
    image   = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    os_type = "Linux"
    cpu     = "1"
    memory  = "2"
  }

  webapp = {
    sku_name = "P1v2"
  }
}

module "storage" {
  source               = "../../modules/storage"
  resource_group_name  = module.shared.resource_group_name
  application_metadata = local.application_metadata

  storage_account = {
    type             = "Standard"
    replication_type = "LRS"
  }

  static_website = {
    home_page  = "../../../src/index.html"
    error_page = "../../../src/error.html"
  }
}