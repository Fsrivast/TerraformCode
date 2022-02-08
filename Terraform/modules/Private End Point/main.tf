resource "azurerm_public_ip" "ip" {
  ipname                = "public_ip"
  sku                 = "Standard"
  location            = var.location
  resource_group_name = var.rgname
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "example-lb"
  sku                 = "Standard"
  location            = var.location
  resource_group_name = var.rgname

  frontend_ip_configuration {
    name                 = azurerm_public_ip.ip.ipname
    public_ip_address_id = azurerm_public_ip.ip.id
  }
}

resource "azurerm_private_link_service" "private_link" {
  name                = "mylink"
  location            = var.location
  resource_group_name = var.rgname

  nat_ip_configuration {
    name      = azurerm_public_ip.ip.ipname
    primary   = true
    subnet_id = azurerm_subnet.service.id
  }

  load_balancer_frontend_ip_configuration_ids = [
    azurerm_lb.example.frontend_ip_configuration.0.id,
  ]
}

resource "azurerm_private_endpoint" "pe" {
  name                = "private_endpoint"
  location            = var.location
  resource_group_name = var.rgname
  subnet_id           = module.azurerm_subnet.subnet_id 

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_private_link_service.private_link.id
    is_manual_connection           = false
  }
}
