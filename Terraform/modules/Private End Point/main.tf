#Subnet where PE is to be created
data "azurerm_subnet" "pe_subnet" {
  name                 = var.pe_network.subnet_name
  virtual_network_name = var.pe_network.vnet_name
  resource_group_name  = var.pe_network.resource_group_name
}

# Resource Group where the private Endpoint will reside.
data "azurerm_resource_group" "pe_rg" {
  name = var.pe_resource_group_name
}

###############################
# Create a new Private Endpoint
###############################
resource "azurerm_private_endpoint" "pe" {
  name                = var.pe_name
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
    name                 = var.dns.zone_name
    private_dns_zone_ids = var.dns.zone_ids
  }
}
