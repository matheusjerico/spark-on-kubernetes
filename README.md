# Spark no Kubertes
>  Esse projeto foi desenvolvido utilizando Linux. Alguns `Targets` do `Makefile` utilizam comandos nativos do Linux.

## Objetivo
Criar uma insfraestrutura utilizando os princípios de Infraestrutura como Código (IaC) para executar jobs `Spark` utilizandoo `Kubernetes` e `Airflow` utilizando `Terraform`.

Em ambiente de desenvolvimento, vamos utilizar o `minikube` para criar a infraestrutura local, instalar o `Airflow` e o `Spark Operator`. Após a configuração necessária para a Infraestrutura, vamos criar aplicações utilizando Spark.

## Requisitos
Instale os pacotes necessários para o desenolvimento do Projeto na sua máquina local utilizando `Makefile`:
```bash
make install-requirements
```

## Criando a Infraestrutura em Ambiente Local
Crie a infraestrutura utilizando `Makefile`:
```bash
make create-infraestructure
```

> Caso seja necessário destruir a infraestrutura criada com `Terraform` e `Minikube`, execute:
```bash
make create-infraestructure
```

