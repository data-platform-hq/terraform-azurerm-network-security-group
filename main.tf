locals {
  nsg_name = var.custom_nsg_name == null ? "nsg-${var.project}-${var.env}-${var.location}" : var.custom_nsg_name
}

resource "azurerm_network_security_group" "this" {
  count = length(var.security_rules) != 0 ? 1 : 0

  name                = local.nsg_name
  location            = var.location
  resource_group_name = var.resource_group

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value["name"]
      description                = security_rule.value["description"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = lookup(security_rule.value, "source_address_prefix", null)
      source_address_prefixes    = lookup(security_rule.value, "source_address_prefixes", [])
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }
  tags = var.tags
}
