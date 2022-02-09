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
}
module "Subnet" {
  source   = "./modules/Subnet" 
  rgname   = var.rgname     
  location = var.location
  sname    = var.subnetname
}
module "DNS" {
  source   = "./modules/DNS" 
  rgname   = var.rgname     
  location = var.location
  linkname = var.linkname
} 
module "acr" {
  source   = "./modules/DNS" 
  rgname   = var.rgname     
  location = var.location
  name = var.acrname
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
