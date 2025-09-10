Deploying Product Microservices with MongoDB using Docker Compose
================================================================

This guide demonstrates running a **Product Web** and **Product Server** microservice architecture with **MongoDB** and mounted volumes using **Docker Compose**.

----------------------------------------------------------------
System Architecture
----------------------------------------------------------------

                                Browser
                                ↓
                                Product Web (Frontend, Port 8080)
                                ↓
                                Kafka (Message Queue)
                                ↓
                                Product Server (Backend, Port 8081)
                                ↓
                                MongoDB (Container with mounted volume)
                                ⇔ Persistent Volume (mounted at /home/docker/mongodata)

----------------------------------------------------------------
1. Create MongoDB Data Directory
----------------------------------------------------------------

                                Log into Minikube VM and create the MongoDB data folder:

                                minikube ssh
                                mkdir -p /home/docker/mongodata

----------------------------------------------------------------
2. Build and Run Application with Docker Compose
----------------------------------------------------------------

                                From the project folder:

                                eval $(minikube docker-env)
                                sh makeandrun.sh

                                This script will:

                                - Build **Product Web** and **Product Server** microservices  
                                - Package Docker images  
                                - Start MongoDB, Product Server, and Product Web using **docker-compose**  

                                Sample output:

                                Network ch09-02_santonix-network  Created
                                Volume "ch09-02_db-data"      Created
                                Container mongo               Created
                                Container product-server      Created
                                Container product-web         Created

----------------------------------------------------------------
3. View Logs
----------------------------------------------------------------

                                MongoDB, Product Server, and Product Web logs will automatically stream during startup.  

                                Example highlights:

                                - MongoDB starts with WiredTiger storage engine  
                                - Product Server initializes with Spring Boot v3.2.0  
                                - Product Web starts and connects to backend  

----------------------------------------------------------------
4. Verify MongoDB Data Persistence
----------------------------------------------------------------

                                minikube ssh
                                cd /home/docker/mongodata
                                ls

                                You should see MongoDB data files like WiredTiger, journal, and .wt collections.

----------------------------------------------------------------
5. Check Running Containers
----------------------------------------------------------------

                                docker ps -a

                                Example output:

                                CONTAINER ID   IMAGE                PORTS                     NAMES
                                ce87baac5629   santonix/product-web     0.0.0.0:8080->8080/tcp    product-web
                                e5ba8e0b327a   santonix/product-server  0.0.0.0:8081->8081/tcp    product-server
                                1ab728047d18   mongo:4.2.24         0.0.0.0:27017->27017/tcp  mongo

----------------------------------------------------------------
6. Get Minikube IP
----------------------------------------------------------------

                                eval $(minikube docker-env)
                                minikube ip

                                Example: 192.168.64.6

----------------------------------------------------------------
7. Test the Application
----------------------------------------------------------------

                                Open in browser:

                                http://<minikube-ip>:8080/product.html