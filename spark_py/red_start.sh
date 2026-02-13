#!/bin/bash 
# Start the Spark cluster
# Usage: ./red_start.sh 
# docker run -it --name redbrick-test redbrick/redbrick:latest /bin/bash
# sleep 2
# docker exec redbrick-test ps aux | grep -i redbrick


# set -e

# POD_NAME="av-redbrick"
# NAMESPACE="default"

# kubectl delete pod  $POD_NAME 
# # 1️⃣ Create pod with Redbrick + Python
# cat <<EOF | kubectl apply -f -
# apiVersion: v1
# kind: Pod
# metadata:
#   name: $POD_NAME
#   namespace: $NAMESPACE
# spec:
#   containers:
#     - name: redbrick
#       image: redbrick/redbrick:latest
#       ports:
#         - containerPort: 12345

#   volumes:
#     - name: shared-scripts
#       emptyDir: {}
# EOF

# echo "✅ Pod $POD_NAME created. Waiting for it to be ready..."
# kubectl wait --for=condition=Ready pod/$POD_NAME --timeout=120s


#!/bin/bash

#!/bin/bash

kubectl delete deployment spark-master
kubectl delete deployment spark-worker

echo "Deploying Spark Master in default namespace..."

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: spark-master
spec:
  replicas: 1
  selector:
    matchLabels:
      app: spark-master
  template:
    metadata:
      labels:
        app: spark-master
    spec:
      containers:
      - name: spark-master
        image: bitnami/spark:3.4.1
        imagePullPolicy: IfNotPresent
        env:
        - name: SPARK_MODE
          value: master
        ports:
        - containerPort: 7077
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: spark-master
spec:
  selector:
    app: spark-master
  ports:
  - name: spark
    port: 7077
    targetPort: 7077
  - name: webui
    port: 8080
    targetPort: 8080
  type: ClusterIP
EOF

echo "Deploying Spark Worker..."

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: spark-worker
spec:
  replicas: 1
  selector:
    matchLabels:
      app: spark-worker
  template:
    metadata:
      labels:
        app: spark-worker
    spec:
      containers:
      - name: spark-worker
        image: bitnami/spark:3.4.1
        imagePullPolicy: IfNotPresent
        env:
        - name: SPARK_MODE
          value: worker
        - name: SPARK_MASTER_URL
          value: spark://spark-master:7077
EOF

echo "Done. Current pods:"
kubectl get pods
