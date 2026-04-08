module "platform" {
  source           = "./platform"
  resource_postfix = var.gcp_resource_postfix
  reader_service_accounts = [
    module.go_playground.admin_service_account.email,
    module.aws_website_terraform.admin_service_account.email,
    module.wheel_of_meeting.admin_service_account.email,
  ]
}
