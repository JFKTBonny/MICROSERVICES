Deploying Product Microservices with MongoDB (Mounted Volume, Docker)
================================================================

This walkthrough shows how to build, package, and run Product Web & Product Server microservices with **MongoDB** using Docker, while ensuring MongoDB data persists via mounted files.

----------------------------------------------------------------
Architecture
----------------------------------------------------------------

        Browser
          ↓
        Product Web (Port 8080)
          ↓
        Product Server (Port 8081)
          ↓
        MongoDB Container
          ⇔ Mounted Host Directory (/home/bonny/mongodata)

----------------------------------------------------------------
1. Build & Package Microservices
----------------------------------------------------------------

        eval $(minikube docker-env)
        sh makeandrun.sh

        - Builds **Product Web** and **Product Server** JARs  
        - Creates Docker images `santonix/product-web` and `santonix/product-server`  

----------------------------------------------------------------
2. Verify MongoDB Data Directory
----------------------------------------------------------------

        minikube ssh
        ls /home/bonny/mongodata

        You should see MongoDB persistence files (`WiredTiger`, `journal`, `.wt` files, etc.).

----------------------------------------------------------------
3. Check Running Containers
----------------------------------------------------------------

        docker ps

        Expected:

        - `product-web` → Port 8080  
        - `product-server` → Port 8081  
        - `mongo` → Port 27017  

----------------------------------------------------------------
4. View Logs
----------------------------------------------------------------

        - Product Server logs:

          docker logs -f <product-server-container-id>

        - Product Web logs:

          docker logs -f <product-web-container-id>

----------------------------------------------------------------
5. Test the Microservice
----------------------------------------------------------------

        minikube ip

        Open in browser:

        http://<minikube-ip>:8080/product.html

        Example: http://192.168.64.6:8080/product.html

        ✅ Product list should appear.

----------------------------------------------------------------
6. Demonstrate MongoDB Persistence
----------------------------------------------------------------

        1. Stop Mongo container:

          docker rm -f <mongo-container-id>

        2. Start new Mongo container with same volume:

          docker run -d -it -p 27017:27017      --name mongo      --net=santonix-network      -v /home/bonny/mongodata:/data/db      mongo:4.2.24

        3. Check containers:

          docker ps

        4. Re-test application:

          http://<minikube-ip>:8080/product.html