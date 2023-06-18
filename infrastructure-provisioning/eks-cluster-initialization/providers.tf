provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path    = "C:\\Users\\paulp\\.kube\\config"
}

provider "helm" {
  kubernetes {
    config_path    = "C:\\Users\\paulp\\.kube\\config"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-nagp-k8s-devops-backend"
    key    = "initializer/terraform.tfstate"
    region = "ap-south-1"
  }
}