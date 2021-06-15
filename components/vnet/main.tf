resource "azurerm_resource_group" "rg" {
  name     = "pipshared${var.env}rg"
  location = "UK South"
}

module "vnet" {
  source                = "git@github.com:hmcts/cnp-module-vnet?ref=fix-address-prefix"
  name                  = var.name
  location              = var.location
  address_space         = var.address_space
  source_range          = var.address_space
  env                   = var.env
  lb_private_ip_address = cidrhost(cidrsubnet(var.address_space, 4, 2), -2)

  common_tags = var.common_tags
}

