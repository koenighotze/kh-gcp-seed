variable "region" {
  type    = string
  default = "europe-west3"
}

variable "gcp_resource_postfix" {
  type        = string
  description = "The postfix id used for GCP resources"
}

variable "workload_identity_provider_name" {
  type        = string
  description = "The name of the workload identity provider"
}

variable "workload_identity_pool_id" {
  type        = string
  description = "The name of the workload identity pool (workload_identity_pool_name)"
}
