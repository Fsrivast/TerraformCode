#test
terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformDevOps"
    storage_account_name = "fiservdevopssa"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" 
  rgname   = var.rgname     
  location = var.location
}
module "VNET" {
  source   = "./modules/VNET" 
  rgname   = var.rgname     
  location = var.location
  vname    = var.vnetname
  sname    = var.subnetname
  }
