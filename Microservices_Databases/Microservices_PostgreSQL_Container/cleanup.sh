mvn -Dmaven.test.skip=true clean
docker stop product-web
docker stop product-server
docker stop postgres-docker
docker rm product-web
docker rm product-server
docker rm postgres-docker
docker rmi -f santonix/product-web
docker rmi -f santonix/product-server
docker network rm santonix-network