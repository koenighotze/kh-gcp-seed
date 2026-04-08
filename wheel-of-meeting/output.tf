output "admin_service_account" {
  description = "The email of the service account"
  value       = google_service_account.admin
}

output "wheel_of_meeting_terraform_project_number" {
  value = data.google_project.wheel_of_meeting.number
}

output "cloud_run_runtime_sa_email" {
  description = "Email of the Cloud Run runtime service account"
  value       = google_service_account.cloud_run_runtime.email
}

output "terraform_state_bucket_name" {
  value       = google_storage_bucket.terraform_state.name
  description = "The name of the GCS bucket used for Terraform state"
}
