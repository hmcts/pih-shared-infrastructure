resource "azurerm_resource_group" "rg" {
  name     = "pipshared${var.env}rg"
  location = "UK South"
}

module "claim-store-vault" {
  source              = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                = "rhubarb-fe-${var.env}" // Max 24 characters
  product             = var.product
  env                 = var.env
  object_id           = var.jenkins_AAD_objectId
  resource_group_name = azurerm_resource_group.rg.name
  product_group_name  = "DTS Publishing and Information" # e.g. MI Data Platform, or dcd_cmc
  common_tags         = var.common_tags
}

