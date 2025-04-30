resource "google_service_account" "admin" {
  project      = data.google_project.platform.project_id
  account_id   = "${local.project_name}-admin-sa"
  display_name = "Platform infrastructure admin"
  description  = "Admin service account for ${data.google_project.platform.project_id}"
}

#trivy:ignore:CKV_GCP_49
resource "google_project_iam_member" "platform_iam_member_project" {
  for_each = toset([
    "roles/artifactregistry.admin",
    "roles/logging.logWriter",
  ])
  project = data.google_project.platform.project_id
  role    = each.value

  member = google_service_account.admin.member
}
