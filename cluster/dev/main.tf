module "airflow" {
  source = "../modules/airflow"
}

module "spark-operator" {
  source = "../modules/spark-operator"
}

module "minio-operator" {
  source = "../modules/minio-operator"
}