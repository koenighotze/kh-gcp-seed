variable "resource_postfix" {
  description = "The postfix for all resources"
  type        = string
  default     = "go-playground"
}

variable "location" {
  description = "The location where the GCS bucket will be created"
  type        = string
  default     = "EUROPE-WEST3"
}
