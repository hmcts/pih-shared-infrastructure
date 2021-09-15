# resource "azurerm_resource_group" "apim" {
#   name     = "pip-apim-${var.env}-rg"
#   location = "UK South"
# }

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

resource "azurerm_api_management" "example" {
  name                = "pip-apim-svc-${var.env}"
  location            = "UK South"
  resource_group_name = "pip-apim-${var.env}-rg"
  publisher_name      = "Publishing and information Project"
  publisher_email     = "publishingandinformation@hmcts.net"

  sku_name             = "Premium_1"
  virtual_network_type = "None"
  tags                 = local.common_tags
}