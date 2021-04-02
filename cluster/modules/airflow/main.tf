resource "helm_release" "airflow" {
  name       = "airflow"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "airflow"
  namespace  = "airflow"

  set {
    name  = "executor"
    value = "CeleryExecutor"
  }

  set {
    name  = "auth.username"
    value = "admin"
  }

  set {
    name  = "auth.password"
    value = "admin"
  }

  set {
    name  = "git.dags.enabled"
    value = "true"
  }

  set {
    name  = "git.dags.repositories[0].repository"
    value = "https://matheusjerico:<PERSONAL_TOKEN_GIT>@github.com/matheusjerico/spark-on-kubernetes.git"
  }

  set {
    name  = "git.dags.repositories[0].name"
    value = "github"
  }

  set {
    name  = "git.dags.repositories[0].branch"
    value = "master"
  }

  set {
    name  = "git.dags.repositories[0].path"
    value = "dags"
  }

}
