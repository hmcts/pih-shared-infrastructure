resource "azurerm_resource_group" "rg" {
  name     = "pih-shared-infra-${var.env}-rg"
  location = "UK South"
}
