docker build -t grafana_image srcs/grafana;
kubectl apply -f srcs/grafana/grafana.yaml;
