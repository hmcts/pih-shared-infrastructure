resource "azurerm_resource_group" "rg" {
  name     = "pipshared${var.env}rg"
  location = "UK South"
}

module "storage_account" {
  source                 = "github.com/hmcts/cnp-module-storage-account.git?ref=Fix_Vars"
  env                    = var.env
  storage_account_name   = "pipshared${var.env}sa"
  account_kind           = "StorageV2"
  resource_group_name    = "pipshared${var.env}rg"
  enable_data_protection = "true"

}
