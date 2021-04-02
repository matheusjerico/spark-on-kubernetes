variable "namespace_airflow" {
  description = "Namespace to be used on Airflow system"
  default     = ""
}

variable "helm_repository_airflow" {
  description = "Helm repository to be used on Airflow system"
  default     = ""
}

variable "helm_chart_airflow" {
  description = "Helm chart to be used on Airflow system"
  default     = ""
}