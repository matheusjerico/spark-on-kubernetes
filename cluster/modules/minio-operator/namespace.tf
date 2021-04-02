resource "kubernetes_namespace" "minio" {
  metadata {
    name = "minio"
  }
}
