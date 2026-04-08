module "platform" {
  source           = "./platform"
  resource_postfix = var.gcp_resource_postfix
  reader_service_accounts = [
    module.go_playground.admin_service_account.email,
    module.aws_website_terraform.admin_service_account.email,
    module.wheel_of_meeting.admin_service_account.email,
    # Cloud Run runtime SA needs to pull images from the platform AR
    module.wheel_of_meeting.cloud_run_runtime_sa_email,
  ]
  writer_service_accounts = [
    # Cloud Build SA for the wheel-of-meeting project pushes images here
    "${module.wheel_of_meeting.wheel_of_meeting_terraform_project_number}@cloudbuild.gserviceaccount.com",
  ]
}
