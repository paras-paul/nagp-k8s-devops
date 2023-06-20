# NAGP 2023 K8s and Devops Advanced Assessment!

The project has following directory structure:
- **.github/workflows**: Containes github actions CI yaml configurations to build the docker images and push to ECR repo.
- **ecommerce-public-api**: This contains public api code and its dockerfile.
- **infrastructure-provisioning**: This contains terraform scripts to provision EKS cluster
- **k8s**: This contains yaml files used to deploy Kubernetes objects on EKS cluster.
- **postgres-db**: This contains docker file for custom postgres image alongwith db initialisation scripts.

# Cloud Provider
- AWS has been used for this project.
- Images have been stored in AWS ECR.
- AWS EKS has been used for creating K8s cluster.

# ecommerce-public-api

- .Net Based Api
- Has 3 endpoints but currently only products endpoints work and they get data from a postgres db container.
- Gets the postgres db configurations from environment variables in container.
- Environment Variables are set via config-map and secrets created for postgres db.
- Docker build command: ***`docker build -t nagp-k8s-devops-assessment/ecommerce-public-api .`***
- The image has been pushed to both private and public ECR repositories.
- Public ECR Image Url: [ECR Public Gallery - nagp-k8s-devops-assessment/ecommerce-public-api](https://gallery.ecr.aws/i8i2q6x3/nagp-k8s-devops-assessment/ecommerce-public-api)

## postgres-db

- Contains a dockerfile and initdb sql script file.
- Initdb script is required to create an initial database(nagp), a table(Products) and an entry in the table.
- Dockerfile: 
`FROM  library/postgres`
`COPY  init.sql  /docker-entrypoint-initdb.d/`
- Docker build command: ***`docker build -t postgres-custom .`***
- Public ECR Image Url: https://gallery.ecr.aws/i8i2q6x3/postgres-custom

## ECR Public Url

- https://gallery.ecr.aws/i8i2q6x3?page=1

## Swagger API Spec

- http://ecommerce.paraspaul.com/swagger/index.html
- GET Endpoint: `bash curl -X 'GET' \
  'http://ecommerce.paraspaul.com/Product/GetProducts' \
  -H 'accept: text/plain'`
  
 - POST Endpoint: `bash
curl -X 'POST' \
  'http://ecommerce.paraspaul.com/Product/AddProduct' \
  -H 'accept: text/plain' \
  -H 'Content-Type: application/json' \
  -d '{
  "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "name": "IPhone14",
  "price": 80000,
  "description": "Dynamic Island"
}'`

## Kubernetes Deployment Commands
1. Namespace Creation: `kubectl apply -f .\k8s\namespace.yaml`
2. Objects Creation: `kubectl apply -f .\k8s\`
