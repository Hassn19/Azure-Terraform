variable "resource_group_name" {
  type = string
  description = "name of the resource group"
}

variable "location" {
  type = string
  description = "Azure region"
}

variable "admin_username" {
  type = string
  description = "admin usernaem for the VM"
}

variable "admin_password" {
  type = string
  description = "Admin password for VM"
  sensitive = true
}