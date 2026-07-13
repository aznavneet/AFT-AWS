variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_role_arn" {
  description = "IAM Role assumed by Terraform"
  type        = string
}

variable "ct_management_account_id" {
  description = "Control Tower Management Account"
  type        = string
}

variable "log_archive_account_id" {
  description = "CloudTrail Administrator Account"
  type        = string
}

variable "audit_account_id" {
  description = "Aggregator Account"
  type        = string
}

variable "aft_management_account_id" {
  description = "AFT Management Account"
  type        = string
}

variable "ct_home_region" {
  description = "Control Tower Home Region"
  type        = string
}

variable "vcs_provider" {
  description = "Version Control System"
  type        = string
  default     = "gitlab"
}

variable "account_request_repo_name" {
  type = string
}

variable "account_request_repo_branch" {
  type    = string
  default = "main"
}

variable "global_customizations_repo_name" {
  type = string
}

variable "global_customizations_repo_branch" {
  type    = string
  default = "main"
}

variable "account_customizations_repo_name" {
  type = string
}

variable "account_customizations_repo_branch" {
  type    = string
  default = "main"
}