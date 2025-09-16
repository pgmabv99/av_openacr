import org.apache.spark.sql.SparkSession;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.Encoders;

import java.util.Arrays;
import java.util.List;

public class HelloSpark {
    public static void hello(SparkSession spark) {
        System.out.println("Hello, Spark!");
        // Sample data
        List<Person> data = Arrays.asList(
                new Person("Alice", 25),
                new Person("Bob", 30),
                new Person("Charlie", 35));

        // Create Dataset
        Dataset<Row> df = spark.createDataset(data, Encoders.bean(Person.class)).toDF();

        // Show the DataFrame
        System.out.println("=== Hello Spark DataFrame ===");
        df.show();

    }

    public static void main(String[] args) {

        // Create Spark session
        // SparkSession spark = SparkSession.builder()
        // .appName("HelloSpark")
        // .master("local[*]")
        // .getOrCreate();

        SparkSession spark = SparkSession.builder()
                .appName("HelloSpark")
                .master("local[*]")

                // Register a catalog named "dev"
                .config("spark.sql.catalog.mycatalog", "org.apache.iceberg.spark.SparkCatalog")
                .config("spark.sql.catalog.mycatalog.type", "rest")
                .config("spark.sql.catalog.mycatalog.uri", "http://dev.x2-4.kafkacw-1.ctrl-0:1758")
                .config("spark.sql.catalog.mycatalog.warehouse", "s3://bucket-dev.x2-4.kafkacw-1")

                // MinIO S3 settings from connector
                .config("spark.sql.catalog.mycatalog.io-impl", "org.apache.iceberg.aws.s3.S3FileIO")
                .config("spark.sql.catalog.mycatalog.s3.endpoint", "http://dev.x2-4.minio-1.ext-0:1673")
                .config("spark.sql.catalog.mycatalog.s3.access-key-id", "minioadmin")
                .config("spark.sql.catalog.mycatalog.s3.secret-access-key", "minioadmin")
                .config("spark.sql.catalog.mycatalog.s3.path-style-access", "true")
                .config("spark.sql.catalog.mycatalog.client.region", "us-east-1")

                .getOrCreate();

        spark.sparkContext().setLogLevel("ERROR");
        // hello(spark);
        readTable(spark);

        // Stop Spark
        spark.stop();
    }

    // method to read Iceberg table dev.mytesttable
    public static void readTable(SparkSession spark) {

        spark.sql("SHOW NAMESPACES IN mycatalog").show();
        spark.sql("SHOW TABLES IN mycatalog.dev").show();

        System.out.println("=== Iceberg Table via DataFrame  mycatalog.dev.mytesttable ===");
        Dataset<Row> df1 = spark.read()
        .format("iceberg")
        .load("mycatalog.dev.mytesttable");
        df1.show();
        
        System.out.println("=== Iceberg Table via SQL mycatalog.dev.mytesttable ===");
        Dataset<Row> df2 = spark.sql("SELECT * FROM mycatalog.dev.mytesttable LIMIT 10");
        df2.show();
    }

    public static class Person {
        private String name;
        private int age;

        // Empty constructor for Spark
        public Person() {
        }

        public Person(String name, int age) {
            this.name = name;
            this.age = age;
        }

        // Getters and setters
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }
    }
}
