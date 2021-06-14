resource "azurerm_resource_group" "apim" {
  name     = "pip-apim-${var.env}-rg"
  location = "UK South"
}

resource "azurerm_api_management" "example" {
  name                = "pih-apim-svc-${var.env}"
  location            = azurerm_resource_group.apim.location
  resource_group_name = azurerm_resource_group.apim.name
  publisher_name      = "Publishing and information Project"
  publisher_email     = "publishingandinformation@hmcts.net"

  sku_name = "Developer_1"
  virtual_network_type = "none"
  portal = "https://pip-apim-svc-${var.env}.developer.azure-api.net"
  developer_portal = "https://pip-apim-svc-${var.env}.developer.azure-api.net"

}