resource "azurerm_subnet" "subnet" {
  sname                = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
  enforce_private_link_endpoint_network_policies = true
}

