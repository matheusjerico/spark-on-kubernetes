ARG IMAGE
FROM $IMAGE

USER root

COPY ./jars/ $SPARK_HOME/jars
COPY app /app

WORKDIR /app

USER ${spark_uid}