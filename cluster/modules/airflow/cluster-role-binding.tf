resource "kubernetes_cluster_role_binding" "airflow-operator" {
  metadata {
    name = "airflow-operator"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "airflow-operator"
    namespace = "operator"
  }
}

resource "kubernetes_cluster_role_binding" "airflow-processing" {
  metadata {
    name = "airflow-processing"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "airflow-operator"
    namespace = "processing"
  }
}
