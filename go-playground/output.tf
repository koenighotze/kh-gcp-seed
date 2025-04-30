output "admin_service_account" {
  description = "The email of the service account"
  value       = google_service_account.admin
}

output "terraform_state_bucket_name" {
  value       = google_storage_bucket.terraform_state.name
  description = "The name of the GCS bucket used for Terraform state"
}

output "go_playground_project_number" {
  value = data.google_project.go_playground.number
}
