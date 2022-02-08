output "subnet_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_subnet.subnet.id
}
