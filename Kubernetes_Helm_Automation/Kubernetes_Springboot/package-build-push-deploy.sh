mvn clean package dockerfile:build

# docker push santonix/spring-boot-docker-k8s-helm:latest
eval $(minikube docker-env)
kubectl create -f ./k8s/deployment.yml
kubectl create -f ./k8s/service.yml
sleep 5
minikube service springboothelm --url
sleep 3
kubectl get pods
kubectl get services