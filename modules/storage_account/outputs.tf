output "name" {
  value = azurerm_storage_account.storage.name
}

output "wbesite_url" {
  value = azurerm_storage_account.storage.primary_web_endpoint
}

output "primary_access_key" {
  value = azurerm_storage_account.storage.primary_access_key
  sensitive = true
}

output "blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}