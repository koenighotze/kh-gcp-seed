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

resource "github_actions_secret" "gcp_cloud_run_service_account" {
  repository      = local.repository_name
  secret_name     = "CLOUD_RUN_SERVICE_ACCOUNT"
  plaintext_value = google_service_account.cloud_run_runtime.email
}

resource "github_actions_secret" "ar_image" {
  repository      = local.repository_name
  secret_name     = "GCP_AR_IMAGE"
  plaintext_value = "europe-west3-docker.pkg.dev/platform-${var.resource_postfix}/docker-${var.resource_postfix}/wheel-of-meeting:latest"
}
