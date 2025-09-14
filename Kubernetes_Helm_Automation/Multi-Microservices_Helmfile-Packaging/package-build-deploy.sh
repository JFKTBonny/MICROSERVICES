mvn -Dmaven.test.skip=true clean package
eval $(minikube docker-env)
docker build  --build-arg JAR_FILE=02-ProductWeb/target/*.jar -t santonix/product-web .
docker build  --build-arg JAR_FILE=01-ProductServer/target/*.jar -t santonix/product-server .
helmfile repos
helmfile sync
sleep 10
minikube service product-web --url
sleep 3
helm list
kubectl get deployments