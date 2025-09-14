mvn clean package
mvn clean compile jib:build
kubectl create -f ./k8s/deployment.yml
kubectl create -f ./k8s/service.yml