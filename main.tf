terraform {
  backend "gcs" {
    # provided via the commandline
    # bucket = ""
    prefix = "terraform/kh-gcp-seed/state"
  }
}
