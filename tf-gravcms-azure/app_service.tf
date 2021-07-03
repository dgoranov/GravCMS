
resource "azurerm_app_service_plan" "default" {
  name                = "${var.name}-Plan"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  kind                = "Windows"
  reserved            = false
  per_site_scaling    = false
  sku {
    tier = "${var.plan_tier}"
    size = "${var.plan_sku}"
  }
}

resource "azurerm_app_service" "default" {
  name                = "${var.dns_prefix}-${var.name}-${var.environment}-app"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  app_service_plan_id = "${azurerm_app_service_plan.default.id}"
  site_config {
    php_version = "7.4"
    scm_type = "VSO"
  }
  source_control {
    branch = "main"
    manual_integration = false
    repo_url = "https://drundo-client-services@dev.azure.com/drundo-client-services/kreios-gravcms-terraform/_git/kreios-gravcms-terraform"
    rollback_enabled = false
    use_mercurial = false
  }

}