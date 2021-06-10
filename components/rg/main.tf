resource "azurerm_resource_group" "rg" {
  name     = "pih-sharedinfra-${var.env}-rg"
  location = "UK South"
}

module "storage_account" {
  source                   = "git@github.com:hmcts/cnp-module-storage-account.git?ref=master"
  env                      = "${var.env}"
  storage_account_name     = "${var.storage_account_name}"

  
}
