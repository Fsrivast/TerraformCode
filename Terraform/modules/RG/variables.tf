variable "location" {
  description = "The Azure region to deploy the new Resource Group"
  type        = string
  default     = "UK South"
}

variable "rg_name" {
  description = "The name ot assign to the new Resource Group"
  type        = string
  default     = "RG-TEST"
}
