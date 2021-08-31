locals {
  sharedServicePrefix = "pipshared${var.env}"
  sharedInfraPrefix   = "pip-sharedservices-${var.env}-"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.sharedServicePrefix}rg"
  location = "UK South"
}

module "storage_account" {
  source                 = "github.com/hmcts/cnp-module-storage-account.git?ref=Fix_Vars"
  env                    = var.env
  storage_account_name   = "${local.sharedServicePrefix}sa"
  account_kind           = "BlockBlobStorage"
  resource_group_name    = azurerm_resource_group.rg1.name
  enable_data_protection = "true"
}

resource "azurerm_storage_container" "piptfstateterraform" {
  name                  = "piptfstateterraform"
  storage_account_name  = "${local.sharedServicePrefix}sa"
  container_access_type = "private"
}

resource "azurerm_resource_group" "rg1" {
  name     = "${local.sharedInfraPrefix}-rg"
  location = "UK South"
}