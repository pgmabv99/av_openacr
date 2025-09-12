import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.Encoders;

import java.util.Arrays;
import java.util.List;

public class HelloSpark {
    public static void main(String[] args) {

        // Create Spark session
        SparkSession spark = SparkSession.builder()
                .appName("HelloSpark")
                .master("local[*]")
                .getOrCreate();
        spark.sparkContext().setLogLevel("ERROR");

        // Sample data
        List<Person> data = Arrays.asList(
                new Person("Alice", 25),
                new Person("Bob", 30),
                new Person("Charlie", 35)
        );

        // Create Dataset
        Dataset<Row> df = spark.createDataset(data, Encoders.bean(Person.class)).toDF();

        // Show the DataFrame
        System.out.println("=== Hello Spark DataFrame ===");
        df.show();

        // Stop Spark
        spark.stop();
    }

    public static class Person {
        private String name;
        private int age;

        // Empty constructor for Spark
        public Person() {}

        public Person(String name, int age) {
            this.name = name;
            this.age = age;
        }

        // Getters and setters
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public int getAge() { return age; }
        public void setAge(int age) { this.age = age; }
    }
}
