# #trivy:ignore:avd-gcp-0066,CKV_GCP_62
# resource "google_storage_bucket" "terraform_state" {
#   name     = "${var.project_id}-tf-state"
#   location = var.location
#   project  = var.project_id

#   storage_class = "STANDARD"

#   versioning {
#     enabled = true
#   }

#   public_access_prevention    = "enforced"
#   uniform_bucket_level_access = true
# }

