resource "azurerm_network_interface" "nic" {
    name                = "linux-vm-nic"
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                            = "internal"
        subnet_id                       = azurerm_subnet.subnet.id 
        private_ip_address_allocation   = "Dynamic"
        public_ip_address_id            = azurerm_public_ip.public_ip.id 
    }
}

resource "azurerm_public_ip" "public_ip" {
  name = "linux-vm-public-ip"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
  sku = "Standard"

}

resource "azurerm_virtual_network" "vnet" {
  name = "linux-vm-vnet"
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name          = "linux-vm-subnet" 
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name = "linux-vm-nsg"
  location = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name = "SSH"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name = "liux-vm"
  resource_group_name = var.resource_group_name
  location = var.location
  size = "Standard_B2s"
  admin_username = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name = "linux-os-disk"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  disable_password_authentication = false
}