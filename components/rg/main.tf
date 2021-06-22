resource "azurerm_resource_group" "rg" {
  name     = "pipshared${var.env}rg"
  location = "UK South"
}

resource "azurerm_resource_group" "rg1" {
  name     = "pip-sharedservices-${var.env}-rg"
  location = "UK South"
}

resource "azurerm_resource_group" "rg2" {
  name     = "pip-apim-${var.env}-rg"
  location = "UK South"
}



module "storage_account" {
  source                 = "github.com/hmcts/cnp-module-storage-account.git?ref=Fix_Vars"
  env                    = var.env
  storage_account_name   = "pipshared${var.env}sa"
  account_kind           = "BlockBlobStorage"
  resource_group_name    = "pipshared${var.env}rg"
  enable_data_protection = "true"
  ip_rules               = ["0.0.0.0/0"]
}

resource "azurerm_storage_container" "piptfstateterraform" {
  name                  = "piptfstateterraform"
  storage_account_name  = "pipshared${var.env}sa"
  container_access_type = "private"
}