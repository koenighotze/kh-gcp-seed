resource "google_service_account" "admin" {
  project      = data.google_project.wheel_of_meeting.project_id // TODO seed project
  account_id   = "wheel-of-meeting-admin-sa"
  display_name = "wheel-of-meeting infrastructure admin"
  description  = "Admin service account for ${data.google_project.wheel_of_meeting.project_id}"
}

# Dedicated runtime identity for the Cloud Run service.
# Separating it from the admin SA limits blast radius: a compromised
# Cloud Run container cannot obtain deployment or infrastructure permissions.
resource "google_service_account" "cloud_run_runtime" {
  project      = data.google_project.wheel_of_meeting.project_id
  account_id   = "wheel-of-meeting-run-sa"
  display_name = "wheel-of-meeting Cloud Run runtime"
  description  = "Runtime service account for the Cloud Run service in ${data.google_project.wheel_of_meeting.project_id}"
}

#trivy:ignore:CKV_GCP_49
resource "google_project_iam_member" "wheel_of_meeting_iam_member_project" {
  for_each = toset([
    "roles/logging.logWriter",
    # run.developer (not run.admin): deploy/update services without managing IAM on them
    "roles/run.developer",
    # artifactregistry.repoAdmin allows Terraform to create/manage repositories
    # without granting project-level AR IAM management (unlike artifactregistry.admin).
    # Day-to-day image pushes are performed by the Cloud Build SA, not this one.
    "roles/artifactregistry.repoAdmin",
    "roles/cloudbuild.builds.editor",
  ])
  project = data.google_project.wheel_of_meeting.project_id
  role    = each.value

  member = google_service_account.admin.member
}

# serviceAccountUser scoped to the Cloud Run runtime SA only — not project-wide.
# This allows the admin SA (used by GitHub Actions) to deploy Cloud Run services
# that run as wheel-of-meeting-run-sa, without being able to impersonate any
# other service account in the project.
resource "google_service_account_iam_member" "admin_acts_as_runtime" {
  service_account_id = google_service_account.cloud_run_runtime.name
  role               = "roles/iam.serviceAccountUser"
  member             = google_service_account.admin.member
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
