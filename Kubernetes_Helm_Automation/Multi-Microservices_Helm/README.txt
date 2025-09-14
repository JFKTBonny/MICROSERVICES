


This setup demonstrates how to deploy a full microservices stack — two Spring Boot services (product-web and product-server), a PostgreSQL database, and Adminer — into Minikube using Helm charts. 
An Ingress controller is configured to expose services via friendly hostnames (products.acme.test, adminer.acme.test). 
Each component (Postgres, product services, Adminer, ingress) is packaged as its own Helm chart, with values and overrides defined in acme-*.yaml files. 
The workflow includes building Docker images locally (with minikube docker-env), templating and linting charts, installing releases via Helm, and validating the deployments. 
The result is a complete CRUD microservices environment where the browser interacts through ingress → product-web → product-server → PostgreSQL, with Adminer providing DB management.

#######################################################################################################################################

This project shows how to deploy a complete microservices stack into Minikube using Helm charts.

It includes:
        - PostgreSQL database
        - Adminer (DB management UI)
        - Product Server microservice
        - Product Web microservice
        - Ingress controller with custom hostnames

The flow is:
            Browser => Ingress => Product Web μS => Product Server μS => PostgreSQL DB
                                              \--> Adminer (for DB management)

***************************
NB: - We defined a generic Helm Chart(app in this case)
    - We reused it accross multiple microservices only by injecting specific values into template...
    - We used a script(package-build-deploy.sh) to install those charts at once...                                              