from pyspark.sql import SparkSession
from pyspark import SparkContext, SparkConf
import config


if __name__ == '__main__':

    df_fifa = spark.read \
        .format("csv") \
        .option("inferSchema", "true") \
        .json("s3a://raw/data.csv")

    df_fifa.show()
    df_fifa.printSchema()
    df_fifa.createOrReplaceTempView("view_fifa")
    df_fifa_sql = spark.sql("SELECT name, age, Overall, Potential, Value FROM view_fifa ORDER BY value DESC")
    df_fifa_sql.show()
    df_fifa_sql.write.format("delta").mode("overwrite").save("s3a://semantic/")

    spark.stop()
