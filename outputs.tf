output "platform_admin_service_account_email" {
  description = "The email of the service account"
  value       = module.platform.admin_service_account.email
}

output "platform_terraform_state_bucket_name" {
  value       = module.platform.terraform_state_bucket_name
  description = "The name of the GCS bucket used for Terraform state"
}

output "platform_project_number" {
  value       = module.platform.platform_project_number
  description = "The project number of the platform project"
}

output "platform_docker_registry_url" {
  value       = module.platform.docker_registry_url
  description = "The URL of the Artifact Registry Docker repository for private projects"
}

output "go_playground_admin_service_account_email" {
  description = "The email of the service account"
  value       = module.go_playground.admin_service_account.email
}

output "go_playground_terraform_state_bucket_name" {
  value       = module.go_playground.terraform_state_bucket_name
  description = "The name of the GCS bucket used for Terraform state"
}

output "go_playground_project_number" {
  value       = module.go_playground.go_playground_project_number
  description = "The project number of the go-playground project"
}

output "aws_website_terraform_admin_service_account_email" {
  description = "The email of the service account"
  value       = module.aws_website_terraform.admin_service_account.email
}

output "aws_website_terraform_project_number" {
  value       = module.aws_website_terraform.aws_website_terraform_project_number
  description = "The project number of the aws-website-terraform project"
}

output "wheel_of_meeting_service_account_email" {
  description = "The email of the service account"
  value       = module.wheel_of_meeting.admin_service_account.email
}

output "wheel_of_meeting_terraform_project_number" {
  value       = module.wheel_of_meeting.wheel_of_meeting_terraform_project_number
  description = "The project number of the wheel-of-meeting project"
}

output "wheel_of_meeting_terraform_state_bucket_name" {
  value       = module.wheel_of_meeting.terraform_state_bucket_name
  description = "The name of the GCS bucket used for Terraform state"
}
