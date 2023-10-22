# GO WEBSERVER DEVOPS PROJECT

This project aims to create a Go web server using devops tools like Docker, Kubernetes, and Terraform.

The scripts are located in the scripts folder.

## Docker Compose
To run the web server using Docker Compose, simply execute:

```bash
docker-compose up -d 
```

[Containers](./prints/containers.png)

This will start three containers: one for the web server, one for the MySQL database, and one for Adminer (a tool to debug the database). You can check the running containers by using the command docker ps. The web application can be accessed at http://localhost:8080.

[Compose Running](./prints/compose-running.png)

## Kubernetes

To deploy the resources in a Kubernetes cluster, navigate to the "kubernetes" folder and make sure you are in the correct context by running:

```bash
kubeclt config use-context <YOUR-CONTEXT>
```

Then, apply the YAML files in the following order:

```bash
kubectl apply -f namespace.yaml
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f app.yaml
kubectl apply -f service.yaml
```

[Pods](./prints/pods.png)

The volumes are used for storing logs. You can check the deployed resources using commands like kubectl get pods -n webserver. The application can be accessed at http://localhost:30000.

[Kubernetes Running](./prints/kubernetes-running.png)

## Terraform

In the "terraform" folder, initialize Terraform by running:

```bash
terraform init 
```

Then, deploy the YAML files using Terraform

```bash
terraform apply
```

## Linux

In the "linux" folder, there is a script called "automation.sh" that automates image tagging and checks for changes in deployments. You can run it by executing:

```bash
./automation.sh 
```
