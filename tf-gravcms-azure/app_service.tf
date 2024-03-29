
resource "azurerm_app_service_plan" "default" {
  name                = "${var.name}-serviceplan"
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
  count               = var.instance_count
  name                = (count.index == 0 ? "${var.dns_prefix}-${var.name}-${var.environment_devel}-app" : "${var.dns_prefix}-${var.name}-${var.environment_prod}-app")
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  app_service_plan_id = "${azurerm_app_service_plan.default.id}"

  site_config {
    php_version = "7.4"
    # scm_type = "VSO"
  }

  source_control {
    branch = (count.index == 0) ? var.source_control_branch_devel : var.source_control_branch_prod
    manual_integration = false
    repo_url = var.source_control_url
    rollback_enabled = false
    use_mercurial = false
  }
}