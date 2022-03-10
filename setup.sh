#!/bin/sh
minikube --driver=virtualbox --memory='3000' --disk-size 20000MB start

minikube addons enable metallb;
minikube addons enable dashboard;

kubectl apply -f ./srcs/metallb.yaml;
eval $(minikube docker-env);

bash srcs/nginx/start.sh;
bash srcs/mysql/start.sh;
bash srcs/wp/start.sh;
bash srcs/pma/start.sh;
bash srcs/ftps/start.sh;
bash srcs/influxdb/start.sh;
bash srcs/grafana/start.sh;

minikube dashboard;
