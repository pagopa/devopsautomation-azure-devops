variable "dev_subscription_name" {
  type        = string
  description = "DEV Subscription name"
}

variable "uat_subscription_name" {
  type        = string
  description = "UAT Subscription name"
}

variable "prod_subscription_name" {
  type        = string
  description = "PROD Subscription name"
}

variable "project_name_prefix" {
  type        = string
  description = "Project name prefix (e.g. userregistry)"
}

variable "pipeline_environments" {
  type        = list(any)
  description = "List of environments pipeline to create"
}

locals {
  prefix           = "project"
  azure_devops_org = "pagopaspa"
  github_org       = "pagopa"

  # 🔐 KV
  dev_key_vault_name  = "${local.prefix}-d-azdo-weu-kv"
  uat_key_vault_name  = "${local.prefix}-u-azdo-weu-kv"
  prod_key_vault_name = "${local.prefix}-p-azdo-weu-kv"

  dev_key_vault_resource_group  = "${local.prefix}-d-sec-rg"
  uat_key_vault_resource_group  = "${local.prefix}-u-sec-rg"
  prod_key_vault_resource_group = "${local.prefix}-p-sec-rg"

  #
  # IaC
  #
  iac-variables = {}
  # global secrets
  iac-variables_secret = {}

  # code_review vars
  iac-variables_code_review = {}
  # code_review secrets
  iac-variables_secret_code_review = {}

  # deploy vars
  iac-variables_deploy = {}
  # deploy secrets
  iac-variables_secret_deploy = {}
}
