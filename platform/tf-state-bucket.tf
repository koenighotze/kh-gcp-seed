resource "google_storage_bucket" "terraform_state" {
  name     = "${var.project_id}-tf-state"
  location = var.location
  project  = var.project_id

  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

