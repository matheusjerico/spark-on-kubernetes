resource "kubernetes_namespace" "operator" {
  metadata {
    name = "operator"
  }
}

resource "kubernetes_namespace" "processing" {
  metadata {
    name = "processing"
  }
}