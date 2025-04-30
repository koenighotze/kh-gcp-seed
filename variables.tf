variable "region" {
  type    = string
  default = "europe-west3"
}

variable "gcp_resource_postfix" {
  type        = string
  description = "The postfix id used for GCP resources"
}
