from os import getenv
from datetime import datetime, timedelta
from airflow import DAG
from airflow.providers.amazon.aws.sensors.s3_key import S3KeySensor
from airflow.providers.amazon.aws.operators.s3_list import S3ListOperator
from airflow.providers.amazon.aws.operators.s3_delete_objects import S3DeleteObjectsOperator
from airflow.providers.cncf.kubernetes.operators.spark_kubernetes import SparkKubernetesOperator
from airflow.providers.cncf.kubernetes.sensors.spark_kubernetes import SparkKubernetesSensor

RAW_ZONE = getenv("RAW_ZONE", "raw")
SEMANTIC_ZONE = getenv("SEMANTIC_ZONE", "semantic")

default_args = {
    'owner': 'Matheus Jericó',
    'start_date': datetime(2021, 4, 1),
    'depends_on_past': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=10)}

with DAG(
    'minio-fifa-spark-operator',
    default_args=default_args,
    schedule_interval='@daily',
    tags=['development', 's3', 'minio', 'spark-operator']
) as dag:

    etl_fifa_spark_operator = SparkKubernetesOperator(
        task_id='etl_fifa_spark_operator',
        namespace='processing',
        application_file='etl-fifa.yaml',
        kubernetes_conn_id='minikube',
        do_xcom_push=True)

    monitor_spark_app_status = SparkKubernetesSensor(
        task_id='monitor_spark_app_status',
        namespace="processing",
        application_name="{{ task_instance.xcom_pull(task_ids='etl_fifa_spark_operator')['metadata']['name'] }}",
        kubernetes_conn_id="minikube")

    delete_s3_file_raw_zone = S3DeleteObjectsOperator(
        task_id='delete_s3_file_raw_zone',
        bucket=RAW_ZONE,
        keys='data.csv',
        aws_conn_id='minio',
        do_xcom_push=True)

    etl_fifa_spark_operator >> monitor_spark_app_status >> delete_s3_file_raw_zone
