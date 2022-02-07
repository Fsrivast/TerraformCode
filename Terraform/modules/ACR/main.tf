resource "azurerm_container_registry" "acr" {
  name                = var.acrname
  resource_group_name = var.rgname
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  }
