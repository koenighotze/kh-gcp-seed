variable "region" {
  type    = string
  default = "europe-west3"
}

variable "platform_project_id" {
  type        = string
  description = "Id of the project where the platform resources will be deployed"
}
