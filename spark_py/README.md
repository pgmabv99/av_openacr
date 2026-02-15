# Spark + delta + kafka

### install 

```
cd ~/Downloads   # or any temp dir
wget https://archive.apache.org/dist/spark/spark-4.0.2/spark-4.0.2-bin-hadoop3.tgz


tar xvf spark-4.0.2-bin-hadoop3.tgz
sudo mv spark-4.0.2-bin-hadoop3 /opt/spark   # standard name

cp /opt/spark/conf/log4j2.properties.template \
   /opt/spark/conf/log4j2.properties

nano /opt/spark/conf/log4j2.properties


change to 

rootLogger.level = error
```

### run 
```
spark_kafka.sh nj1-4.x2-3.ext-0:1519
```


files will be created in the current directory, e.g.
```
(venv) [0 Feb 14 16:59:39] avorovich@nj1.sv5:~/av_openacr/spark_py/test_topic_delta 
$ ls -ltr
total 8
-rw-r--r-- 1 avorovich avorovich  834 Feb 14 16:57 part-00000-6bf00a06-fb02-4c6c-8eb6-d78b176738cf-c000.snappy.parquet
drwxr-xr-x 3 avorovich avorovich 4096 Feb 14 16:57 _delta_log
```