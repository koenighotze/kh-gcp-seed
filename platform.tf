resource "google_project_iam_member" "project_iam_member" {
  project = var.platform_project_id
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:${var.seed_sa_email_address}"
}

module "platform" {
  depends_on = [google_project_iam_member.project_iam_member]

  source     = "./platform"
  project_id = var.platform_project_id
}
