from pyspark import SparkContext, SparkConf
from config import spark

if __name__ == '__main__':
    print(f"=============> Reading data from Minio.")
    df_fifa = spark.read \
        .format("csv") \
        .option("sep", ",") \
        .option("inferSchema", "true") \
        .option("header", "true") \
        .load("s3a://raw/data.csv")

    df_fifa.show()
    df_fifa.printSchema()
    df_fifa.createOrReplaceTempView("view_fifa")
    df_fifa_sql = spark.sql("SELECT name, age, Overall, Potential, Value FROM view_fifa ORDER BY value DESC")
    df_fifa_sql.show()

    print(f"=============> Saving data into Minio.")
    df_fifa_sql.write.format("delta").mode("overwrite").save("s3a://semantic/fifa/")

    spark.stop()
