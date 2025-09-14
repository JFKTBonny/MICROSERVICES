

This project demonstrates deploying a full CRUD microservices architecture in Minikube using Helmfile for orchestration.
Helmfile allows to declare a definition of an entire cluster in a single YAML file and bundles multiple Helm release...
It consists of two microservices (ProductWeb → ProductServer) backed by a PostgreSQL database, with Adminer as a DB management UI.
External access is routed via Ingress, which exposes:

          - products.acme.test → ProductWeb (browser client → ProductServer → PostgreSQL)

          - adminer.acme.test → Adminer (for DB inspection and management)

The setup showcases:
###################

          - Container build & deploy into Minikube’s local Docker registry

          - Helmfile managing multiple Helm releases (ProductWeb, ProductServer, Postgres, Adminer, Ingress Controller)

          - Ingress configuration for domain-based routing

          - End-to-end CRUD operations tested through browser access

Essentially, it’s a microservices + PostgreSQL + Ingress demo on Kubernetes with Helmfile automation.