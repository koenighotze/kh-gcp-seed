resource "google_project_service" "apis" {
  for_each = toset([
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "secretmanager.googleapis.com",
  ])
  project            = data.google_project.wheel_of_meeting.project_id
  service            = each.value
  disable_on_destroy = false
}
