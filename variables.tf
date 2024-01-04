variable "nsg_name" {
  type        = string
  description = "Network Security Group name"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group in which resources is created"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "security_rules" {
  type = list(object({
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    description                  = optional(string, null)
    source_port_range            = optional(string, null)
    source_port_ranges           = optional(list(string), [])
    destination_port_range       = optional(string, null)
    destination_port_ranges      = optional(list(string), [])
    source_address_prefix        = optional(string, null)
    source_address_prefixes      = optional(list(string), [])
    destination_address_prefix   = optional(string, null)
    destination_address_prefixes = optional(list(string), [])
  }))
  description = "List of objects representing security rules"
  default     = []
}
