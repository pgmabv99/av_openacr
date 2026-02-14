# Spark client

### instll 

```
wget https://dlcdn.apache.org/spark/spark-4.1.1/spark-4.1.1-bin-hadoop3.tgz


tar xvf spark-4.1.1-bin-hadoop3.tgz
sudo mv spark-4.1.1-bin-hadoop3 /opt/spark


cp /opt/spark/conf/log4j2.properties.template \
   /opt/spark/conf/log4j2.properties

nano /opt/spark/conf/log4j2.properties


change to 

rootLogger.level = error