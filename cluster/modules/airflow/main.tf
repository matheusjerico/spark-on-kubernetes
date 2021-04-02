resource "helm_release" "airflow-stable" {
  name       = "airflow"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "airflow"
  namespace  = "airflow"

  set {
    name  = "executor"
    value = "CeleryExecutor"
  }
}
