# Spark no Kubernetes
>  Esse projeto foi desenvolvido utilizando Linux. Alguns `Targets` do `Makefile` utilizam comandos nativos do Linux.

O repositório é organizado em 5 pastas:
- cluster
- dags
- data
- images

---
# Cluster

Nessa pasta está o conteúdo necessário para criação da infra projeto.

Utilizando `Shell Script` e `Terraform`, seguindos os padrões de Infraestrutura como Código (*IaC*) vamos criar um cluster Kubernetes com Airflow, Minio e Spark Operator. Em ambiente de desenvolvimento, vamos utilizar o `minikube` para prover o Kubernetes. Após a configuração necessária para a Infraestrutura, vamos criar aplicações utilizando Spark.

Caso seja necessário fazer alguma alteração no Airflow, Minio ou Spark Operator, modifique os arquivos do `terraform` neste diretório.

### 1. Requisitos
- Instale os pacotes necessários para o desenolvimento do Projeto na sua máquina local utilizando `Makefile`:
```bash
make install-requirements
```

### 2. Criar o Cluster


> Para configurar o sincronismo de criação de `DAGs` entre o Airflow e o Github, crie um `personal access token` na sua conta do [Github](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) e altere no arquivo `spark-on-kubernetes/cluster/modules/airflow/main.tf` o valor `PERSONAL_TOKEN_GIT` pelo token criado.

- Criar a infraestrutura utilizando `Makefile`:
```bash
make create-infraestructure
```

### 3. Deletar o Cluster
> Caso seja necessário destruir a infraestrutura criada com `Terraform` e `Minikube`, execute:
```bash
make create-infraestructure
```

### 4. Acessar componentes 
- Acessar o Minio:
```bash
make connect-minio
```

- Acessar o Airflow:
```bash
make connect-airflow
```

---
# Images


Dentro dessa pasta estão as configurações necessárias para criar as imagens do **PySpark** para utilizar em um processo de ETL ou Machine Learning.

```
.
├── base
│   ├── conf
│   │   ├── metrics.properties
│   │   └── prometheus.yaml
│   ├── Dockerfile
│   └── requirements.txt
├── custom
│   ├── app
│   │   ├── config.py
│   │   ├── etl.py
│   │   └── __init__.py
│   ├── Dockerfile
│   └── jars
│       ├── aws-java-sdk-1.7.4.jar
│       ├── delta-core_2.12-0.7.0.jar
│       └── hadoop-aws-2.7.3.jar
└── Makefile
```

A imagem `base` é a criação de uma imagem com PySpark fornecida pelo [Spark Operator](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/tree/master/spark-docker). 

A imagem `custom` é construida utilizando a imagem `base`, mas com um objetivo específico: Fazer ETL de uma base de dados do jogo `FIFA 19`. Dentro dessa imagem temos os `jars` necessários e o `código spark` para fazer o processo de ETL.

### 1. Criando imagens
- Para fazer o `build` e `push` da imagem no Docker Hub, execute o `Makefile`:
```bash
make docker-deploy
```

---
# Dags

Dentro dessa pasta estão as configurações necessárias para criar as DAGs do **Airflow**.
```
.
├── fifa
    ├── etl-fifa.yaml
    └── minio-fifa-spark-operator.py
```
Nesse caso, temos apenas uma DAG que tem o objetivo de fazer um processo de ETL utilizando Spark e Airflow. No processo de ETL, o Spark vai consumir os dados do jogo `FIFA 19` do bucket `raw` no Minio, fazer uma transformação e escrever o resultado no bucket `semantic`.

<!-- 
## Documentação

- Airflow
1. https://towardsdatascience.com/setting-up-data-pipelines-using-apache-airflow-on-kubernetes-4506baea3ce0

- Terraform
1. https://github.com/antonbabenko/terraform-best-practices
 -->