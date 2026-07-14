provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "AWS-AFT"
      Environment = "POC"
      ManagedBy   = "Terraform"
    }
  }
}