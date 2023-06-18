provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path    = "$HOME/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path    = "$HOME/.kube/config"
  }
}