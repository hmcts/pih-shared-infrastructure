resource "azurerm_resource_group" "rg" {
  name     = "pipshared${var.env}rg"
  location = "UK South"
}

module "vnet" {
  source                = "github.com/hmcts/cnp-module-vnet?ref=fix-address-prefix"
  name                  = "pip-sharedinfra-vnet-${var.env}"
  location              = "UK South"
  address_space         = "10.101.1.0/26"
  source_range          = "10.101.1.0/26"
  env                   = var.env
  lb_private_ip_address = cidrhost(cidrsubnet(var.address_space, 4, 2), -2)
  common_tags         = var.common_tags


}

