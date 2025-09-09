mvn -Dmaven.test.skip=true clean package
docker build  --build-arg JAR_FILE=02-ProductWeb/target/*.jar -t santonix/product-web .
docker build  --build-arg JAR_FILE=01-ProductServer/target/*.jar -t santonix/product-server .
docker network create santonix-network
docker pull mongo:5.0.25
docker run -d -it -p 27017:27017 --name mongo  --net=santonix-network  mongo:5.0.25
docker run -d -p 8081:8081  --net=santonix-network --name product-server santonix/product-server
docker run -d -p 8080:8080  --net=santonix-network --name product-web santonix/product-web
