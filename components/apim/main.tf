# resource "azurerm_resource_group" "apim" {
#   name     = "pip-apim-${var.env}-rg"
#   location = "UK South"
# }

resource "azurerm_api_management" "example" {
  name                = "pip-apim-svc-${var.env}"
  location            = azurerm_resource_group.apim.location
  resource_group_name = azurerm_resource_group.apim.name
  publisher_name      = "Publishing and information Project"
  publisher_email     = "publishingandinformation@hmcts.net"

  sku_name             = "Developer_1"
  virtual_network_type = "None"

}