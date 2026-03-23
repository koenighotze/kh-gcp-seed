module "wheel_of_meeting" {
  source                          = "./wheel-of-meeting"
  resource_postfix                = var.gcp_resource_postfix
  workload_identity_pool_id       = var.workload_identity_pool_id
  workload_identity_provider_name = var.workload_identity_provider_name
}
