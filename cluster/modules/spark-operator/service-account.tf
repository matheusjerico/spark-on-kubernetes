resource "kubernetes_service_account" "spark-operator" {
  metadata {
    name = "spark-operator"
    namespace = "operator"
  }
  secret {
    name = "spark-operator"
  }
}

resource "kubernetes_secret" "spark-operator" {
  metadata {
    name = "spark-operator"
  }
}

resource "kubernetes_service_account" "spark-processing" {
  metadata {
    name = "spark-processing"
    namespace = "processing"
  }
  secret {
    name = "spark-processing"
  }
}

resource "kubernetes_secret" "spark-processing" {
  metadata {
    name = "spark-processing"
  }
}