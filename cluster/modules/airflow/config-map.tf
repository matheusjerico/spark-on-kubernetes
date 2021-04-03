resource "kubernetes_config_map" "requirements" {
  metadata {
    name = "requirements"
    namespace = "airflow"
  }

  data = {
    "requirements" = <<EOF
apache-airflow==2.0.1
flake8==3.9.0
pre-commit==2.11.1
apache-airflow-providers-amazon==1.2.0
apache-airflow-providers-postgres==1.0.1
apache-airflow-providers-cncf-kubernetes==1.0.2
minio==7.0.2
pyspark==3.0.0
    EOF
  }
}