
resource "azurerm_app_service_plan" "default" {
  name                = "${var.name}-Plan"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  kind                = "Windows"
  reserved            = false

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
    scm_type = "GitHub"

  }
}

# resource "github_actions_secret" "default" {
#   repository       = ""
#   secret_name      = 
#   plaintext_value  = 
# }

# resource "github_repository_file" "default" {
#   repository          = ""
#   branch              = "main"
#   file                = ""
#   content             = ,
#     {
#       app_location = "/"
#       api_location = "api"
#       output_location = ""
#       api_token_var = local.api_token_var
#     }
#   )
# }