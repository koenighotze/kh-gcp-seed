
output "admin_service_account" {
  description = "The email of the service account"
  value       = google_service_account.admin
}

output "platform_project_number" {
  value = data.google_project.platform.number
}
