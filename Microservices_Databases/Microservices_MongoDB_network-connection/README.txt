This example highlights a Dockerized microservices setup using MongoDB with a custom Docker network (santonix-network) to facilitate communication between services. 

Key observations:

        Network isolation & connectivity:   All containers—ProductWeb, ProductServer, and MongoDB—are connected via santonix-network,
        ********************************    ensuring proper service-to-service communication without exposing unnecessary ports externally...
        
        End-to-end flow:     Browser → ProductWeb → ProductServer → MongoDB follows a clean microservice architecture, separating frontend, backend, and database responsibilities...
        ***************   
        Automated build & deployment:   package-build-deploy.sh handles building, packaging, and starting all containers in one step, reducing manual setup effort.
        ****************************
        Logging & verification:           Container logs confirm successful initialization and data population, 
        **********************             allowing developers to verify that CRUD operations and service interactions are functioning correctly...
        
        Environment cleanup:       cleanup.sh removes all containers, networks, and images, ensuring the setup can be repeatedly deployed in a clean state...
        *******************
        Persistent MongoDB:         MongoDB container maintains its data in a mounted volume, preserving state across container restarts...
        ******************