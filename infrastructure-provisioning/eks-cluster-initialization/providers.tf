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