resource "kubernetes_cluster_role_binding" "spark-operator-airflow-operator" {
  metadata {
    name = "spark-operator-airflow-operator"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "spark-operator"
    namespace = "operator"
  }
}

resource "kubernetes_cluster_role_binding" "spark-operator-airflow-processing" {
  metadata {
    name = "spark-operator-airflow-processing"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "spark-processing"
    namespace = "processing"
  }
}