output "admin_service_account" {
  description = "The email of the service account"
  value       = google_service_account.admin
}

output "aws_website_terraform_project_number" {
  value = data.google_project.aws_website_terraform.number
}
