mvn clean compile jib:build
docker run -it -p 8080:8080 santonix/spring-boot-docker-k8s-helm:latest