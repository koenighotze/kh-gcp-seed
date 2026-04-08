resource "google_service_account" "admin" {
  project      = data.google_project.wheel_of_meeting.project_id // TODO seed project
  account_id   = "wheel-of-meeting-admin-sa"
  display_name = "wheel-of-meeting infrastructure admin"
  description  = "Admin service account for ${data.google_project.wheel_of_meeting.project_id}"
}

#trivy:ignore:CKV_GCP_49
resource "google_project_iam_member" "wheel_of_meeting_iam_member_project" {
  for_each = toset([
    "roles/logging.logWriter",
    "roles/run.admin",
    "roles/artifactregistry.admin",
    "roles/cloudbuild.builds.editor",
    "roles/iam.serviceAccountUser",
    "roles/compute.admin",
    "roles/iap.admin",
  ])
  project = data.google_project.wheel_of_meeting.project_id
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
  member             = "principalSet://iam.googleapis.com/${var.workload_identity_pool_id}/attribute.repository/koenighotze/wheel-of-meeting"
}
