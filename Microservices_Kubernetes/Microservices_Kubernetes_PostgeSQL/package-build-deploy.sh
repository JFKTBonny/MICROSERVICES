mvn -Dmaven.test.skip=true clean package
docker build  --build-arg JAR_FILE=02-ProductWeb/target/*.jar -t santonix/product-web .
docker build  --build-arg JAR_FILE=01-ProductServer/target/*.jar -t santonix/product-server .
kubectl create -f postgres-config.yml
kubectl create -f postgres-pvc.yml
kubectl create -f postgres-deployment.yml 
kubectl create -f postgres-svc.yml 
kubectl create -f product-server-deployment.yml
kubectl create -f product-server-service.yml
kubectl create -f product-web-deployment.yml
kubectl create -f product-web-service.yml
sleep 10
minikube service product-web --url
sleep 3
kubectl get pods
kubectl get services
