module "airflow" {
  source = "../modules/airflow"
}

module "spark-operator" {
  source = "../modules/spark-operator"
}