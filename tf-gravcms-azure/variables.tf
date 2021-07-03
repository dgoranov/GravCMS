variable "name" {
  type        = string
  description = "Location of the azure resource group."
  default     = "gravcms-test-02"
}

variable "instance_count" {
  default = 2
  description = "Number of instances "
}

variable "environment_prod" {
  type        = string
  description = "Name of the deployment environment"
  default     = "production"
}

variable "environment_devel" {
  type        = string
  description = "Name of the deployment environment"
  default     = "development"
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
  default     = "Basic"
}

variable "plan_sku" {
  type        = string
  description = "The sku of app service plan to create"
  default     = "B1"
}
