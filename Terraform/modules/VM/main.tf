resource "azurerm_public_ip" "main" {
  name                = "tfvmpip"
  location            = var.location
  resource_group_name = var.rgname
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

# Create network interface
resource "azurerm_network_interface" "main" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "tfvmNicConfiguration"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}
resource "azurerm_linux_virtual_machine" "main" {
  name                            = var.vm_name
  location                        = var.location
  resource_group_name             = var.rgname
  network_interface_ids           = [azurerm_network_interface.main.id]
  size                            = "Standard_F1"
  computer_name                   = var.computer_name
  admin_username                  = var.vmadmin_name
  admin_password                  = var.vmadminpassword
  disable_password_authentication = false

  os_disk {
    name                 = var.osdiskname
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
