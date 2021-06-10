resource "azurerm_resource_group" "rg" {
  name     = "pip-shared-${var.env}-rg"
  location = "UK South"
}
