resource "azurerm_resource_group" "rg" {
  name     = "pih-sharedinfra-${var.env}-rg"
  location = "UK South"
}
