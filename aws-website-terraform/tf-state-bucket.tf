resource "google_storage_bucket_iam_member" "terraform_state_admin" {
  bucket = var.terraform_state_bucket
  role   = "roles/storage.objectAdmin"
  member = google_service_account.admin.member
}
