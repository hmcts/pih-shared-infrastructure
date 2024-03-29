
#resource "azurerm_resource_group" "rg" {
#  name     = "pip-sharedinfra-${var.env}-rg"
#  location = "UK South"
#}

## module "vnet" {
##   source                = "github.com/hmcts/cnp-module-vnet?ref=fix-address-prefix"
##   name                  = "pip-sharedinfra"
##   location              = "UK South"
##   address_space         = "10.101.1.0/26"
##   source_range          = "10.101.1.0/26"
##   env                   = var.env
##   lb_private_ip_address = cidrhost(cidrsubnet(var.address_space, 4, 2), -2)
##   common_tags           = tomap({
##     Team_contact = "#vh-devops"
##   })
## 
## 
## }

# Generic locals
locals {
  common_tags = module.ctags.common_tags
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  vnet_name           = "pip-sharedinfra-vnet-${var.env}"
  resource_group_name = "pip-sharedinfra-${var.env}-rg"
  vnet_location       = "UK South"
  address_space       = ["10.101.1.0/26"]
  subnet_prefixes     = ["10.101.1.32/27", "10.101.1.0/27"]
  subnet_names        = ["mgmt-subnet-${var.env}", "pip-subnet-${var.env}"]
  tags                = local.common_tags
}

