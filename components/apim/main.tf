resource "azurerm_resource_group" "apim" {
  name     = "pih-apim-svc-${var.env}"
  location = "UK South"
}
