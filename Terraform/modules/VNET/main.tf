resource "azurerm_virtual_network" "vnet" {
  vnet_name           = var.vnetname
  location            = var.location
  resource_group_name = var.rgname
  address_space       = var.address_space
  }

resource "azurerm_subnet" "subnet" {
  sname                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}
