resource "azurerm_private_dns_zone" "dns" {
  dns_name            = "mydomain.com"
  resource_group_name = var.rgname
  location            = var.location
  }
resource "azurerm_private_dns_zone_virtual_network_link" "mylink" {
  name                  = "mylink"
  resource_group_name   = var.rgname
  private_dns_zone_name = azurerm_private_dns_zone.dns.dns_name
  virtual_network_id    = module.azurerm_virtual_network.vnet_id
}
