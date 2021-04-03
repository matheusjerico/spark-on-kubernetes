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

  set {
    name  = "buckets[0].name"
    value = "raw"
  }

  set {
    name  = "buckets[0].policy"
    value = "public"
  }

  set {
    name  = "buckets[0].purge"
    value = "false"
  }

  set {
    name  = "buckets[1].name"
    value = "semantic"
  }

  set {
    name  = "buckets[1].policy"
    value = "public"
  }

  set {
    name  = "buckets[1].purge"
    value = "false"
  }
}
