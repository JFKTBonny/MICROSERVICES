Deploying Product Microservices with MongoDB on Kubernetes
================================================================

This guide walks through running a simple **Product Web** and **Product Server** microservice architecture with **MongoDB** using Minikube and Kubernetes, while persisting MongoDB data with mounted volumes.

----------------------------------------------------------------
System Architecture
----------------------------------------------------------------

            Browser
               ↓
            Product Web (Frontend, Port 8080)
               ↓
            Product Server (Backend, Port 8081)
               ↓
            MongoDB StatefulSet
               ⇔ Persistent Volume (mounted at /home/docker/mongodata)

----------------------------------------------------------------
1. Start Minikube
----------------------------------------------------------------

            minikube start

            Expected output (trimmed):

            😄  minikube v1.30.1 on Darwin 13.3
            ✨  Using the hyperkit driver
            🐳  Preparing Kubernetes v1.26.3
            🌟  Enabled addons: ingress-dns, storage-provisioner, default-storageclass, ingress
            🏄  Done! kubectl is now configured to use "minikube"

----------------------------------------------------------------
2. Prepare MongoDB Data Directory
----------------------------------------------------------------

            Log in to the Minikube VM and create the MongoDB data folder:

            eval $(minikube docker-env)
            minikube ssh
            mkdir -p /home/docker/binil/mongodata

----------------------------------------------------------------
3. Build and Deploy Application
----------------------------------------------------------------

            From the project folder:

            eval $(minikube docker-env)
            sh makeandrun.sh

            This script will:

            - Build **Product Web** and **Product Server** microservices  
            - Create Docker images  
            - Deploy MongoDB, Product Server, and Product Web into Kubernetes  

            Sample output:

            persistentvolume/mongo-data-db created
            persistentvolumeclaim/mongo-data-db created
            statefulset.apps/mongo-cluster created
            service/mongo created
            service/mongo-nodeport created
            deployment.apps/product-server created
            deployment.apps/product-web created

            Check running pods:

            kubectl get pods

            Example:

            mongo-cluster-0                   1/1     Running   0   5s
            product-server-6fb88b6849-q2pfx   1/1     Running   0   4s
            product-web-5dfc886d6d-8cl7t      1/1     Running   0   4s

----------------------------------------------------------------
4. View Logs
----------------------------------------------------------------

            - Product Server logs:

            kubectl logs -f product-server-<pod-id> --tail=15

            - Product Web logs:

            kubectl logs -f product-web-<pod-id> --tail=15

----------------------------------------------------------------
5. Verify MongoDB Data Persistence
----------------------------------------------------------------

            minikube ssh
            cd /home/docker/binil/mongodata
            ls

            You should see MongoDB data files like WiredTiger, journal, and .wt collections.

----------------------------------------------------------------
6. Test the Application
----------------------------------------------------------------

Access the frontend in your browser:

            http://<minikube-ip>:<nodePort>/product.html

