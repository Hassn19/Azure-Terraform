variable "name" {
  description = "ame of the app service"
  type = string
}

variable "location" {
  description = "Location for the app service plan and app"
  type = string
}

variable "resource_group_name" {
  description = "Resource group for the app service"
  type = string
}

variable "tags" {
  description = "tags to apply"
  type = map(string)
}