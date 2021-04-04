resource "kubernetes_role" "role-airflow-spark-operator" {
  metadata {
    name = "role-airflow-spark-operator"
    namespace = "processing"
    labels = {
      airflow = "role-airflow-spark-operator"
    }
  }
  rule {
    api_groups     = ["sparkoperator.k8s.io"]
    resources      = ["sparkapplications"]
    verbs          = ["create", "get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "role-binding-airflow-spark-operator" {
  metadata {
    name      = "role-binding-airflow-spark-operator"
    namespace = "processing"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "role-airflow-spark-operator"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "airflow-operator"
    namespace = "airflow"
  }
}