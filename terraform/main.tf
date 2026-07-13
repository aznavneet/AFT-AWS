module "aft" {
  source = "<official AFT module>"

  ct_management_account_id  = var.ct_management_account_id
  aft_management_account_id = var.aft_management_account_id
  log_archive_account_id    = var.log_archive_account_id
  audit_account_id          = var.audit_account_id

  ct_home_region = var.ct_home_region

  vcs_provider = "gitlab"

  account_request_repo_name = var.account_request_repo_name

  global_customizations_repo_name = var.global_customizations_repo_name

  account_customizations_repo_name = var.account_customizations_repo_name
}