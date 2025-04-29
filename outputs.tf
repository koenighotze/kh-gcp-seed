output "platform_admin_service_account_email" {
  description = "The email of the service account"
  value       = module.platform.admin_service_account.email
}

output "platform_terraform_state_bucket_name" {
  value       = module.platform.terraform_state_bucket_name
  description = "The name of the GCS bucket used for Terraform state"
}

