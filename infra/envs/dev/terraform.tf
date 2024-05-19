terraform {
  required_version = ">= 1.8.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.0"
    }
  }

  cloud {
    organization = "[your hcp org name]"

    workspaces {
      name = "[your hcp workspace name]"
    }
  }
}