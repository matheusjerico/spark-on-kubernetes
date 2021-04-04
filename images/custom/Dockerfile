ARG IMAGE
FROM $IMAGE

USER root:root

RUN mkdir -p /app

COPY ./jars/ $SPARK_HOME/jars

COPY app /app

WORKDIR /app

USER ${spark_uid}