

# Generic locals
locals {
  common_tags = module.ctags.common_tags
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}

module "claim-store-vault" {
  source                  = "github.com/hmcts/cnp-module-key-vault"
  name                    = "pip-shared-kv-${var.env}" // Max 24 characters
  product                 = "pip"
  env                     = var.env
  object_id               = "89713d0c-d5a3-4b8c-98b1-747325916dd4"
  resource_group_name     = "pip-sharedservices-${var.env}-rg"
  product_group_name      = "DTS Publishing and Information" # e.g. MI Data Platform, or dcd_cmc
  create_managed_identity = true
  common_tags             = local.common_tags
}

