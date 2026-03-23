resource "google_service_account" "admin" {
  project      = data.google_project.aws_website_terraform.project_id // TODO seed project
  account_id   = "aws-website-terraform-admin-sa"
  display_name = "aws-website-terraform infrastructure admin"
  description  = "Admin service account for ${data.google_project.aws_website_terraform.project_id}"
}

#trivy:ignore:CKV_GCP_49
resource "google_project_iam_member" "aws_website_terraform_iam_member_project" {
  for_each = toset([
    "roles/logging.logWriter",
  ])
  project = data.google_project.aws_website_terraform.project_id
  role    = each.value

  member = google_service_account.admin.member
}

resource "google_service_account_iam_member" "workload_identity" {
  for_each = toset([
    "roles/iam.workloadIdentityUser",
    "roles/iam.serviceAccountTokenCreator",
  ])
  service_account_id = google_service_account.admin.name
  role               = each.value
  member             = "principalSet://iam.googleapis.com/${var.workload_identity_pool_id}/attribute.repository/koenighotze/aws-website-terraform"
}
