resource "google_secret_manager_secret" "partners" {
  project   = data.google_project.wheel_of_meeting.project_id
  secret_id = "wom-partners-json"
  replication { auto {} }
}

resource "google_secret_manager_secret" "leads" {
  project   = data.google_project.wheel_of_meeting.project_id
  secret_id = "wom-leads-json"
  replication { auto {} }
}

resource "google_secret_manager_secret_iam_member" "runtime_reads_partners" {
  project   = data.google_project.wheel_of_meeting.project_id
  secret_id = google_secret_manager_secret.partners.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = google_service_account.cloud_run_runtime.member
}

resource "google_secret_manager_secret_iam_member" "runtime_reads_leads" {
  project   = data.google_project.wheel_of_meeting.project_id
  secret_id = google_secret_manager_secret.leads.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = google_service_account.cloud_run_runtime.member
}
