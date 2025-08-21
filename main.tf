terraform {
  # backend "azurerm" {
  #   resource_group_name = "rg-terraform-demo"
  #   storage_account_name = "theseconddeathstar"
  #   container_name = "tfstate"
  #   key = "terraform.tfstate"
  # }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}


provider "azurerm" {
    features {}
}

module "rg" {
  source    = "./modules/resource_group"
  name      = var.resource_group_name
  location  = var.location
  tags      = var.tags
}

module "storage" {
  source              = "./modules/storage_account"
  name                = var.storage_account_name
  resource_group_name = module.rg.name
  location            = var.location
  tags                = var.tags
}


# module "app" {
#   source = "./modules/app_service"
#   name = "terraform-demo-app"
#   location = var.location
#   resource_group_name = module.rg.name
#   tags = var.tags
# }

module "linux_vm" {
  source              = "./modules/linux_vm"
  resource_group_name = module.rg.name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}


output "storage_account_name" {
  value =  module.storage.name
}

output "wbesite_url" {
  value = module.storage.wbesite_url
}

output "storage_account_access_key" {
  value     = module.storage.primary_access_key
  sensitive = true
}

output "storage_accout_blob_endpoint" {
  value = module.storage.blob_endpoint
}

# output "app_url" {
#   value = "https://${module.app.default_hostname}"
# }