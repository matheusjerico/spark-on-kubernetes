from datetime import datetime 
from datetime import timedelta
from airflow.models import DAG
from airflow.operators.bash import BashOperator

default_args = {
    'owner': 'Matheus Jericó',
    'depends_on_past': False,
    'retry_delay': timedelta(minutes=10)}

dag = DAG(
    'test-data-pipeline',
    default_args=default_args,
    start_date=datetime(2021, 3, 18),
    schedule_interval='@daily',
    tags=['test'])

t1 = BashOperator(
    task_id='print_date',
    bash_command='date',
    dag=dag)

t2 = BashOperator(
    task_id='echo',
    depends_on_past=False,
    bash_command='echo "Hello World"',
    retries=3,
    dag=dag)

t1 >> [t2]
