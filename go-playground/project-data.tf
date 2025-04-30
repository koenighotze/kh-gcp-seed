data "google_project" "go_playground" {
  project_id = "${local.project_name}-${var.resource_postfix}"
}
