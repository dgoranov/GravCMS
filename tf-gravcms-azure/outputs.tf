# locals {
#   scm_username = "${azurerm_app_service.default.site_credential.0.username}"
#   scm_password = "${azurerm_app_service.default.site_credential.0.password}"
#   repo_uri     = "${replace(azurerm_app_service.default.source_control.0.repo_url, "https://", "")}"
# }

# output "repository_url" {
#   value = "https://${local.scm_username}:${local.scm_password}@${local.repo_uri}/${azurerm_app_service.default.name}.git"
# }

# output "website_url" {
#   value = "${azurerm_app_service.default.default_site_hostname}"
# }
