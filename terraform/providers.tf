provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn     = var.aws_role_arn
    session_name = "gitlab-aft-session"
  }

  default_tags {
    tags = {
      Project     = "AWS-AFT"
      Environment = "POC"
      ManagedBy   = "Terraform"
    }
  }
}