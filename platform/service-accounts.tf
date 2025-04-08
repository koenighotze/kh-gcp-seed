resource "google_service_account" "admin" {
  project      = var.project_id
  account_id   = "platform-admin-sa"
  display_name = "Platform infrastructure admin"
  description  = "Admin service account for ${var.project_id}"
}

resource "google_project_iam_member" "platform_iam_member_project" {
  for_each = toset([
    "roles/artifactregistry.admin",
    "roles/logging.logWriter",
  ])
  project = var.project_id
  role    = each.value

  member = google_service_account.admin.member
}
