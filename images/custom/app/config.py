from pyspark import SparkContext, SparkConf

conf = (
SparkConf()
    .set("spark.hadoop.fs.s3a.endpoint", "http://minio.minio.svc.cluster.local:9000")
    .set("spark.hadoop.fs.s3a.access.key", "accessKey")
    .set("spark.hadoop.fs.s3a.secret.key", "secretKey")
    .set("spark.hadoop.fs.s3a.path.style.access", True)
    .set("spark.hadoop.fs.s3a.fast.upload", True)
    .set("spark.hadoop.fs.s3a.connection.maximum", 100)
    .set("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")
    .set("spark.delta.logStore.class", "org.apache.spark.sql.delta.storage.S3SingleDriverLogStore")
    .set("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
    .set("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
)

sc = SparkContext(conf=conf).getOrCreate()

spark = SparkSession \
        .builder \
        .appName("etl-fifa") \
        .getOrCreate()

spark.sparkContext.setLogLevel("INFO")