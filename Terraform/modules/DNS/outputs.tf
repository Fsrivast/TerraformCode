output "dns_zone" {
  description = "The Name of the newly created vNet"
  value       = azurerm_dns_zone.dns.dns_name
}
output "location" {
  description = "The location of the newly created zone"
  value       = azurerm_virtual_network.dns.location
}
