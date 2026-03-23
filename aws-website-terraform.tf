module "aws_website_terraform" {
  source                          = "./aws-website-terraform"
  resource_postfix                = var.gcp_resource_postfix
  terraform_state_bucket          = "kh-gcp-seed-13bf3f03-tf-state"
  workload_identity_pool_id       = var.workload_identity_pool_id
  workload_identity_provider_name = var.workload_identity_provider_name
}
