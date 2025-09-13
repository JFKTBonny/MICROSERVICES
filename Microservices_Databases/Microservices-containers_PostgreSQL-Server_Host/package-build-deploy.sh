mvn -Dmaven.test.skip=true clean package
docker build  --build-arg JAR_FILE=01-ProductServer/target/*.jar -t santonix/product-server .
docker build  --build-arg JAR_FILE=02-ProductWeb/target/*.jar -t santonix/product-web .
docker network create santonix-network
#docker run -d -p 8081:8081 --net=santonix-network --add-host=host:192.168.8.103 --name product-server -e DB_SERVER=host:5432 -e POSTGRES_DB=productdb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres santonix/product-server
docker run -d -p 8081:8081 --net=santonix-network --add-host=host:192.168.1.40 --name product-server -e DB_SERVER=host:5432 -e POSTGRES_DB=productdb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres santonix/product-server
docker run -d -p 8080:8080 --net=santonix-network --name product-web -e acme.PRODUCT_SERVICE_URL=http://192.168.58.2:8081/products santonix/product-web

