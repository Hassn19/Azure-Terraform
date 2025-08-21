resource "azurerm_storage_account" "storage" {
    name                        = var.name
    resource_group_name         = var.resource_group_name
    location                    = var.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
    tags                        = var.tags
}

resource "azurerm_storage_account_static_website" "web" {
    storage_account_id = azurerm_storage_account.storage.id
    index_document = "index.html"
    error_404_document = "404.html"
}