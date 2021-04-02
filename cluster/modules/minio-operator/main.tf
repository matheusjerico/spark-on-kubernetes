resource "helm_release" "minio" {
  name       = "minio"
  repository = "https://helm.min.io/"
  chart      = "minio"
  namespace  = "minio"

  set {
    name  = "accessKey"
    value = "accessKey"
  }

  set {
    name  = "secretKey"
    value = "secretKey"
  }

}
