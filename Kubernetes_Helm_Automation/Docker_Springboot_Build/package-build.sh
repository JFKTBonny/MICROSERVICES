mvn clean package dockerfile:build
docker tag binildas/spring-boot-docker-k8s-helm:latest santonix/spring-boot-docker-k8s-helm:latest
docker push santonix/spring-boot-docker-k8s-helm:latest
docker run -it -p 8080:8080 santonix/spring-boot-docker-k8s-helm:latest