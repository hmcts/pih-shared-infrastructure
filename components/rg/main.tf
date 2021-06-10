resource "azurerm_resource_group" "pih-shared-${var.env}-rg" {
  name     = "pih-shared-${var.env}-rg"
  location = "UK South"
}