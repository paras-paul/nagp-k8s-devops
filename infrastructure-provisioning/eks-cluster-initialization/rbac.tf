resource "kubernetes_cluster_role_binding_v1" "github_actions_rbac" {
  metadata {
    name = "github-actions-rbac"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "User"
    name      = "paras"
    api_group = "rbac.authorization.k8s.io"
  }
}