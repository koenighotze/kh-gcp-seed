resource "github_actions_secret" "workload_identity_provider_name" {
  repository      = "aws-website-terraform"
  secret_name     = "WORKLOAD_IDENTITY_PROVIDER_NAME"
  plaintext_value = var.workload_identity_provider_name
}

resource "github_actions_secret" "gcp_service_account" {
  repository      = "aws-website-terraform"
  secret_name     = "GCP_SERVICE_ACCOUNT"
  plaintext_value = google_service_account.admin.email
}

resource "github_actions_secret" "tf_state_bucket" {
  repository      = "aws-website-terraform"
  secret_name     = "TF_STATE_BUCKET"
  plaintext_value = var.terraform_state_bucket
}
