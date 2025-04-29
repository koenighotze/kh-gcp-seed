variable "project_id" {
  description = "The project ID to deploy the platform resources"
  type        = string
}

variable "resource_prefix" {
  description = "The prefix for all resources"
  type        = string
  default     = "platform"
}

variable "location" {
  description = "The location where the GCS bucket will be created"
  type        = string
  default     = "EUROPE-WEST3"
}
