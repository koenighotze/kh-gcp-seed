output "admin_service_account" {
  description = "The email of the service account"
  value       = google_service_account.admin
}

output "terraform_state_bucket_name" {
  value       = google_storage_bucket.terraform_state.name
  description = "The name of the GCS bucket used for Terraform state"
}

output "platform_project_number" {
  value = data.google_project.platform.number
}

output "docker_registry_url" {
  description = "The URL of the Artifact Registry Docker repository"
  value       = "${lower(var.location)}-docker.pkg.dev/${data.google_project.platform.project_id}/${google_artifact_registry_repository.docker.repository_id}"
}
