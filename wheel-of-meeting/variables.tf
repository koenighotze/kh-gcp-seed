variable "resource_postfix" {
  description = "The postfix for all resources"
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

variable "location" {
  description = "The location where the GCS bucket will be created"
  type        = string
  default     = "EUROPE-WEST3"
}
