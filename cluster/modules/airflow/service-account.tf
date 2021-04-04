resource "kubernetes_service_account" "airflow-operator" {
  metadata {
    name = "airflow-operator"
    namespace = "operator"
  }
  secret {
    name = "airflow-operator"
  }
}

resource "kubernetes_secret" "airflow-operator" {
  metadata {
    name = "airflow-operator"
  }
}
