provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-nagp-k8s-devops-backend"
    key    = "provisioner/terraform.tfstate"
    region = "ap-south-1"
  }
}
