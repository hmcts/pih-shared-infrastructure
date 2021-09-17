locals {
  sharedServicePrefix = "pipshared${var.env}"
  sharedInfraPrefix   = "pip-sharedservices-${var.env}"
  common_tags         = module.ctags.common_tags
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.sharedServicePrefix}rg"
  location = "UK South"
  tags     = local.common_tags
}

module "storage_account" {
  source                 = "github.com/hmcts/cnp-module-storage-account.git?ref=master"
  env                    = var.env
  storage_account_name   = "${local.sharedServicePrefix}sa"
  account_kind           = "BlockBlobStorage"
  resource_group_name    = azurerm_resource_group.rg1.name
  enable_data_protection = "true"
  common_tags            = local.common_tags
}

resource "azurerm_storage_container" "piptfstateterraform" {
  name                  = "piptfstateterraform"
  storage_account_name  = "${local.sharedServicePrefix}sa"
  container_access_type = "private"
}

resource "azurerm_resource_group" "rg1" {
  name     = "${local.sharedInfraPrefix}-rg"
  location = "UK South"
  tags     = local.common_tags
}