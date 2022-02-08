output "dns_zone" {
  description = "The Name of the newly created dns"
  value       = azurerm_dns_zone.dns.dns_name
}
output "dns_id" {
  description = "The ID of the newly created dns"
  value       = azurerm_dns_zone.dns.dns_ids
}
