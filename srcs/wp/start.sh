docker build -t wp_image srcs/wp;
kubectl apply -f srcs/wp/wp.yaml;
