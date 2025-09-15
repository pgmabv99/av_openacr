## java prereq

jvm 17
mvn

## run 
git clone https://github.com/Aiven-Open/tiered-storage-for-apache-kafka.git

add missing jar for encryption 
``` 
cd /home/avorovich/tiered-storage-for-apache-kafka/demo/iceberg/plugin

mvn dependency:copy -Dartifact=software.amazon.awssdk:s3:2.32.30 -DoutputDirectory=.
mvn dependency:copy -Dartifact=software.amazon.awssdk:kms:2.32.30 -DoutputDirectory=.
mvn dependency:copy -Dartifact=software.amazon.awssdk:sts:2.32.30 -DoutputDirectory=.
mvn dependency:copy -Dartifact=software.amazon.awssdk:auth:2.32.30 -DoutputDirectory=.
mvn dependency:copy -Dartifact=software.amazon.awssdk:regions:2.32.30 -DoutputDirectory=.
```

follow https://github.com/Aiven-Open/tiered-storage-for-apache-kafka/blob/main/demo/iceberg/README.md

## select

when data is loaded into parquet use this to flatten data 

```
%%sql

SELECT 
    value.firstName AS firstName,
    value.lastName AS lastName,
    value.age AS age,
    value.title AS title,
    value.birthdate AS birthdate,
    value.created AS created,
    value.updated AS updated,
    value.comments AS comments
FROM default.people
LIMIT 1
```