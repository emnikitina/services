docker build -t pma_image srcs/pma;
kubectl apply -f srcs/pma/pma.yaml;
