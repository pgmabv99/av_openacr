
#   -remove old clickhouse installation

sudo apt-get remove --purge clickhouse-server clickhouse-client
sudo rm -rf /etc/clickhouse-server /var/lib/clickhouse /var/log/clickhouse-server

# install
https://clickhouse.com/docs/install/debian_ubuntu


# start/stop
sudo clickhouse stop
sudo clickhouse start

#client 
clickhouse-client --multiquery <<EOF
CREATE DATABASE IF NOT EXISTS testdb;
CREATE TABLE IF NOT EXISTS testdb.test_table (id UInt32, name String) ENGINE = MergeTree() ORDER BY id;
INSERT INTO testdb.test_table VALUES (1, 'Alice'), (2, 'Bob');
SELECT * FROM testdb.test_table;
EOF



omcli dev.x2-4.minio-1 -start

# create sample json files
echo '{
  "name": "Alexey",
  "role": "developer",
  "projects": ["project1", "project2222"]
}' > /tmp/clickhouse.json
echo '{
  "name": "VP",
  "role": "developer",
  "projects": ["project99", "project88"]
}' > /tmp/clickhouse1.json
echo '{
  "name": "AL",
  "role": "developer",
  "projects": ["project55", "project66"]
}' > /tmp/clickhouse2.json

# copy to clickhouse internal folder
sudo mkdir -p /var/lib/clickhouse/user_files
sudo cp /tmp/clickhouse*.json /var/lib/clickhouse/user_files/
sudo sh -c 'chown clickhouse:clickhouse /var/lib/clickhouse/user_files/clickhouse*.json'

# copy to minio
mc find x2s3/avorovich --name "clickhouse*.json" --exec "mc rm {} --force"
mc cp /tmp/clickhouse*.json x2s3/avorovich/


#  query minio
DROP TABLE IF EXISTS minio_json;
CREATE TABLE minio_json (data String)
ENGINE = S3(
    'http://192.168.10.11:1624/avorovich/clickhouse*.json',
    'minioadmin',
    'minioadmin',
    'JSONAsString'
)
SETTINGS
    s3_endpoint = 'http://192.168.10.11:1624/',
    s3_use_virtual_hosted_style = 0,
    s3_region = 'us-east-1',  -- MinIO default
    s3_sign_url = 0;
SELECT
    JSONExtractString(data, 'name') AS name,
    JSONExtractString(data, 'role') AS role,
    arrayJoin(JSONExtractArrayRaw(data, 'projects')) AS project
FROM minio_json;


# -------------------------------
# query  lfiles in internal folder
DROP TABLE IF EXISTS minio_json;
CREATE TABLE minio_json
(
    data String
)
ENGINE = File('JSONAsString', 'clickhouse*.json');

-- Query the table and extract fields
SELECT
    JSONExtractString(data, 'name') AS name,
    JSONExtractString(data, 'role') AS role,
    arrayJoin(JSONExtractArrayRaw(data, 'projects')) AS project
FROM minio_json;
