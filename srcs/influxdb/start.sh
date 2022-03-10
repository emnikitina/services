docker build -t influxdb_image srcs/influxdb;
kubectl apply -f srcs/influxdb/influxdb.yaml;
