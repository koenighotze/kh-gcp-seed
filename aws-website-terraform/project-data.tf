data "google_project" "aws_website_terraform" {
  project_id = "kh-gcp-seed-${var.resource_postfix}"
}
