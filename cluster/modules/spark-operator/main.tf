resource "helm_release" "spark-operator" {
  name       = "spark-operator"
  repository = "https://googlecloudplatform.github.io/spark-on-k8s-operator"
  chart      = "spark-operator"
  namespace  = "operator"

  set {
    name  = "serviceAccounts.sparkoperator.name"
    value = "spark-operator"
  }

  set {
    name  = "serviceAccounts.spark.name"
    value = "spark-processing"
  }
}
