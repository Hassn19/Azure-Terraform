variable "resource_group_name" {
    description = "the name of the resource group"
    type = string
    default = "rg-terraform-demo"
  
}

variable "location" {
    description = "Azure region"
    type = string
    default = "eastus"
  
}

variable "storage_account_name" {
    description = "Storage account name, it must be unique"
    type = string
  
}

variable "tags" {
  description = "tags to be applied to resources"
  type = map(string)
  default = {
    "environment" = "dev"
    owner = "hassan"
    purpose = "testing remote state"
  }
}

variable "admin_username" {
  description = "Username for the Linux VM"
  type = string
}

variable "admin_password" {
  description = "password for the Linux VM"
  type = string
  sensitive = true
}