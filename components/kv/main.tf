resource "azurerm_resource_group" "rg" {
  name     = "pipshared${var.env}rg"
  location = "UK South"
}

module "claim-store-vault" {
  source              = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                = "pip-shared-kv-${var.env}" // Max 24 characters
  product             = "pip"
  env                 = var.env
  object_id           = "DTS Key Vault Administrators"
  resource_group_name = "pipshared${var.env}rg"
  product_group_name  = "DTS Publishing and Information" # e.g. MI Data Platform, or dcd_cmc


}

