variable "sname" {
  description = "Name of the subnet to create"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  description = "The location of the vnet to create."
  type        = string
  }
