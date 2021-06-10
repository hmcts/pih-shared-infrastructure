resource "azurerm_resource_group" "rg" {
  name     = "pih-shared-${var.env}-rg"
  location = "UK South"
}
