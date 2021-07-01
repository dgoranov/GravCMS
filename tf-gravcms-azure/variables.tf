variable "name" {
  type        = string
  description = "Location of the azure resource group."
  default     = "TerraformGravCms"
}

variable "environment" {
  type        = string
  description = "Name of the deployment environment"
  default     = "Development"
}

variable "location" {
  type        = string
  description = "Location to deploy the resoruce group"
  default     = "West Europe"
}

variable "dns_prefix" {
  type        = string
  description = "A prefix for any dns based resources"
  default     = "tfgcms"
}

variable "plan_tier" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "Test"
}

variable "plan_sku" {
  type        = string
  description = "The sku of app service plan to create"
  default     = "F1"
}
