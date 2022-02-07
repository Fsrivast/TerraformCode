#VNET
variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  #default     = ["10.0.0.0/16"]
}
variable "location" {
  description = "The location of the vnet to create."
  type        = string
  }
