#trivy:ignore:avd-gcp-0066,CKV_GCP_62
resource "google_storage_bucket" "terraform_state" {
  project       = var.project_id
  name          = "${var.project_id}-tf-state"
  location      = var.location
  force_destroy = false

  storage_class = "STANDARD"

  versioning {
    enabled = true
  }
  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}

