mvn -Dmaven.test.skip=true clean package
docker build  --build-arg JAR_FILE=01-ProductServer/target/*.jar -t santonix/product-server .
docker build  --build-arg JAR_FILE=02-ProductWeb/target/*.jar -t santonix/product-web .
docker network create santonix-network
docker run -d --net=santonix-network --name postgres-docker -e POSTGRES_DB=productdb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:15.3-alpine3.18
docker run -d -p 8081:8081 --net=santonix-network --name product-server -e DB_SERVER=postgres-docker:5432 -e POSTGRES_DB=productdb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres santonix/product-server
docker run -d -p 8080:8080 --net=santonix-network --name product-web -e acme.PRODUCT_SERVICE_URL=http://192.168.58.2:8081/products  santonix/product-web


