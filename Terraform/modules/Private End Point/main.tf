# Create a new Private Endpoint

resource "azurerm_private_endpoint" "pe" {
  pename              = var.pe_name
  location            = var.location
  resource_group_name = var.rgname
  subnet_id           = module.azurerm_subnet.subnet_id   

  private_service_connection {
    name                           = var.pe_connection
    is_manual_connection           = false
    private_connection_resource_id = var.endpoint_resource_id
    subresource_names              = var.subresource_names
  }

  private_dns_zone_group {
    name                 = module.azurerm_dns_zone.dns_zone
    private_dns_zone_ids = module.azurerm_dns_zone.dns_ids
  }
}
