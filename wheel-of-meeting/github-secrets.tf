resource "github_actions_secret" "workload_identity_provider_name" {
  repository      = local.repository_name
  secret_name     = "WORKLOAD_IDENTITY_PROVIDER_NAME"
  plaintext_value = var.workload_identity_provider_name
}

resource "github_actions_secret" "gcp_service_account" {
  repository      = local.repository_name
  secret_name     = "GCP_SERVICE_ACCOUNT"
  plaintext_value = google_service_account.admin.email
}

resource "github_actions_secret" "tf_state_bucket" {
  repository      = local.repository_name
  secret_name     = "TF_STATE_BUCKET"
  plaintext_value = google_storage_bucket.terraform_state.name
}

resource "github_actions_secret" "gcp_project_id" {
  repository      = local.repository_name
  secret_name     = "GCP_PROJECT_ID"
  plaintext_value = data.google_project.wheel_of_meeting.project_id
}

resource "github_actions_secret" "cloud_run_sa_email" {
  repository      = local.repository_name
  secret_name     = "CLOUD_RUN_SA_EMAIL"
  plaintext_value = google_service_account.cloud_run_runtime.email
}
