variable "resource_postfix" {
  description = "The postfix for all resources"
  type        = string
}

variable "terraform_state_bucket" {
  description = "The name of the existing GCS bucket used for Terraform state"
  type        = string
}

variable "workload_identity_pool_id" {
  description = "The full resource name of the workload identity pool"
  type        = string
}

variable "workload_identity_provider_name" {
  description = "The full resource name of the workload identity provider"
  type        = string
}
