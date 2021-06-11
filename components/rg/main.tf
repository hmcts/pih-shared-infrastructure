resource "azurerm_resource_group" "rg" {
  name     = "pip-shared-${var.env}-rg"
  location = "UK South"
}

module "storage_account" {
  source               = "github.com/hmcts/cnp-module-storage-account.git?ref=Fix_Vars"
  env                  = var.env
  storage_account_name = "pip-shared-${var.env}-sa"
  account_kind         = "Storage"
  resource_group_name  = "pip-shared-${var.env}-rg"

}
