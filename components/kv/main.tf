# resource "azurerm_resource_group" "rg" {
#   name     = "pipshared${var.env}rg"
#   location = "UK South"
# }

module "claim-store-vault" {
  source                  = "github.com/hmcts/cnp-module-key-vault"
  name                    = "pip-shared-kv-${var.env}" // Max 24 characters
  product                 = "pip"
  env                     = var.env
  object_id               = "89713d0c-d5a3-4b8c-98b1-747325916dd4"
  resource_group_name     = "pip-sharedservices-${var.env}-rg"
  product_group_name      = "DTS Publishing and Information" # e.g. MI Data Platform, or dcd_cmc
  create_managed_identity = true
  common_tags = tomap({
    Team_contact = "#vh-devops"
  })



}

