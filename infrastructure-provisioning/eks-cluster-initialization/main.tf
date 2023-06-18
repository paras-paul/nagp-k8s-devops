data "aws_eks_cluster" "cluster" {
    name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
    name = var.cluster_name
}

resource "kubernetes_storage_class_v1" "gp3-enc" {
  metadata {
    name = "gp3-enc"
  }
  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer"
  allow_volume_expansion = true
  parameters = {
    "encrypted" = "true"
    "fsType" = "ext4"
    "type" = "gp3"
  }
}