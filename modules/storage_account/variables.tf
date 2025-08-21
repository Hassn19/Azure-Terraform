variable "name" {
  description = "Storage account name"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        =  string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "tags to be applied to the storage account"
  type        = map(string)
}