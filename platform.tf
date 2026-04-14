module "platform" {
  source           = "./platform"
  resource_postfix = var.gcp_resource_postfix
  reader_service_accounts = [
    module.go_playground.admin_service_account.email,
    module.aws_website_terraform.admin_service_account.email,
    module.wheel_of_meeting.admin_service_account.email,
    # Cloud Run runtime SA needs to pull images from the platform AR
    module.wheel_of_meeting.cloud_run_runtime_sa_email,
    # Cloud Run Service Agent for wheel-of-meeting must be able to pull images
    # from this cross-project registry during deployment
    "service-${module.wheel_of_meeting.wheel_of_meeting_terraform_project_number}@serverless-robot-prod.iam.gserviceaccount.com",
  ]
  writer_service_accounts = [
    # Admin SA (used by GitHub Actions) pushes images directly via docker push
    module.wheel_of_meeting.admin_service_account.email,
  ]
}
