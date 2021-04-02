variable "namespace_operator_spark" {
  description = "Namespace to be used on Spark Operator"
  default     = ""
}

variable "namespace_processing_spark" {
  description = "Namespace to be used on Spark Application"
  default     = ""
}

variable "service_account_spark_operator" {
  description = "Service Account to be used on Spark Operator"
  default     = ""
}

variable "service_account_spark_processing" {
  description = "Service Account to be used on Spark Application"
  default     = ""
}


variable "helm_repository_spark_operator" {
  description = "Helm repository to be used on Spark Operator system"
  default     = ""
}

variable "helm_chart_spark_operator" {
  description = "Helm chart to be used on Spark Operator system"
  default     = ""
}
