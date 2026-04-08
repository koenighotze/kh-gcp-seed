variable "resource_postfix" {
  description = "The postfix for all resources"
  type        = string
}

variable "location" {
  description = "The location where the GCS bucket will be created"
  type        = string
  default     = "EUROPE-WEST3"
}

variable "reader_service_accounts" {
  description = "List of service account emails granted read access to the Docker registry"
  type        = list(string)
  default     = []
}
