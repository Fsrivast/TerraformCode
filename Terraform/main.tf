# File test
terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformDevOps"
    storage_account_name = "fiservdevopssa"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}

module "AKS" {
  source              = "./modules/AKS"
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  rgname              = var.rgname
  node_resource_group = var.node_resource_group
  system_node_count   = var.system_node_count
}
module "ACR" {
  source   = "./modules/ACR"
  acr_name = var.acr_name
  location = var.location
  rgname   = var.rgname
}
module "VM" {
  source           = "./modules/VM"
  vmadmin_password = var.vmadmin_password
  location         = var.location
  rgname           = var.rgname
}
 module "VNET" {
   source           = "./modules/VNET"
   location         = var.location
   rgname           = var.rgname
   vname            = var.vnetname
}
  module "Subnet" {
    source           = "./modules/Subnet"
    sname            = var.subnetname
    location         = var.location
    rgname           = var.rgname
}
  module "DNS" {
    source           = "./modules/DNS"
    linkname         = var.linkname
    location         = var.location
    rgname           = var.rgname
}
  
