output "id" {
  value       = length(var.security_rules) != 0 ? azurerm_network_security_group.this[0].id : ""
  description = "The ID of the Network Security Group"
}
