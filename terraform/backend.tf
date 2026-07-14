terraform {
  backend "s3" {
    bucket         = "aft-terraform-state-demo"
    key            = "aft/terraform.tfstate"
    region         = "eu-north-1"
  }
}