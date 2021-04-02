# variables spark operator system
variable "namespace_operator_spark" {
  description = "Namespace to be used on Spark Operator"
  default     = "operator"
}

variable "namespace_processing_spark" {
  description = "Namespace to be used on Spark Application"
  default     = "processing"
}

variable "service_account_spark_operator" {
  description = "Service Account to be used on Spark Operator"
  default     = "spark-operator"
}

variable "service_account_spark_processing" {
  description = "Service Account to be used on Spark Application"
  default     = "spark-processing"
}

variable "helm_repository_spark_operator" {
  description = "Helm repository to be used on Spark Operator system"
  default     = "https://googlecloudplatform.github.io/spark-on-k8s-operator"
}

variable "helm_chart_spark_operator" {
  description = "Helm chart to be used on Spark Operator system"
  default     = "spark-operator"
}

# variables airflow system
variable "namespace_airflow" {
  description = "Namespace to be used on Airflow system"
  default     = "airflow"
}

variable "helm_repository_airflow" {
  description = "Helm repository to be used on Airflow system"
  default     = "https://charts.bitnami.com/bitnami"
}

variable "helm_chart_airflow" {
  description = "Helm chart to be used on Airflow system"
  default     = "airflow"
}