resource "github_actions_secret" "workload_identity_provider_name" {
  repository      = "wheel-of-meeting"
  secret_name     = "WORKLOAD_IDENTITY_PROVIDER_NAME"
  plaintext_value = var.workload_identity_provider_name
}

resource "github_actions_secret" "gcp_service_account" {
  repository      = "wheel-of-meeting"
  secret_name     = "GCP_SERVICE_ACCOUNT"
  plaintext_value = google_service_account.admin.email
}

resource "github_actions_secret" "tf_state_bucket" {
  repository      = "wheel-of-meeting"
  secret_name     = "TF_STATE_BUCKET"
  plaintext_value = google_storage_bucket.terraform_state.name
}
