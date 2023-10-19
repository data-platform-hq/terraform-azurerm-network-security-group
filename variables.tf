variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
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

variable "custom_nsg_name" {
  type        = string
  description = "Custom network security group name"
  default     = null
}

variable "security_rules" {
  type = list(object({
    name                       = optional(string)
    description                = optional(string)
    priority                   = optional(number)
    direction                  = optional(string)
    access                     = optional(string)
    protocol                   = optional(string)
    source_port_range          = optional(string)
    destination_port_range     = optional(string)
    source_address_prefix      = optional(string)
    source_address_prefixes    = optional(list(string))
    destination_address_prefix = optional(string)
  }))
  description = "List of objects representing security rules"
  default     = []
}
