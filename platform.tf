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
    # Admin SA (used by GitHub Actions) pushes images directly via docker push
    module.wheel_of_meeting.admin_service_account.email,
  ]
}
