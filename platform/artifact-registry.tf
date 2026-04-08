resource "google_artifact_registry_repository" "docker" {
  project       = data.google_project.platform.project_id
  location      = lower(var.location)
  repository_id = "docker-${var.resource_postfix}"
  description   = "Docker image registry for private projects"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }

  cleanup_policy_dry_run = false

  cleanup_policies {
    id     = "delete-untagged"
    action = "DELETE"
    condition {
      tag_state  = "UNTAGGED"
      older_than = "604800s" # 7 days
    }
  }

  cleanup_policies {
    id     = "keep-recent-versions"
    action = "KEEP"
    most_recent_versions {
      keep_count = 10
    }
  }
}

resource "google_artifact_registry_repository_iam_member" "reader" {
  for_each = toset(var.reader_service_accounts)

  project    = data.google_project.platform.project_id
  location   = google_artifact_registry_repository.docker.location
  repository = google_artifact_registry_repository.docker.name
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${each.value}"
}

resource "google_artifact_registry_repository_iam_member" "writer" {
  for_each = toset(var.writer_service_accounts)

  project    = data.google_project.platform.project_id
  location   = google_artifact_registry_repository.docker.location
  repository = google_artifact_registry_repository.docker.name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${each.value}"
}
