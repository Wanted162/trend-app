# Trend Project 🚀

A complete DevOps project demonstrating containerization, CI/CD, Infrastructure as Code (IaC), and Kubernetes deployment.  
This project is designed to showcase modern DevOps workflows including **Docker**, **Jenkins**, **Terraform**, and **Kubernetes** with **HPA (Horizontal Pod Autoscaler)**.

---

## 📌 Features
- **Frontend Build** → Vite-based app stored in `dist/`
- **Docker** → Containerized application with `Dockerfile`
- **Jenkins** → Automated CI/CD pipeline (`Jenkinsfile`)
- **Terraform** → Infrastructure provisioning (`main.tf`)
- **Kubernetes** → Deployment, Service, Ingress, and HPA manifests under `k8s/`
- **Autoscaling** → Horizontal Pod Autoscaler based on CPU usage
- **NodePort Access** → Application exposed via Kubernetes NodePort
- **Ingress/LoadBalancer -> k8s-trendapp-trending-c80c7ce2ef-300746421.ap-south-1.elb.amazonaws.com**
---

## 🏗️ Architecture Overview

```text
 Developer → GitHub Repo
       ↓
   Jenkins CI/CD
       ↓
  Docker Image Build → Push to Registry
       ↓
  Terraform (AWS EKS + EC2)
       ↓
 Kubernetes Deployment (Pods, Service, HPA)
       ↓
 Application Access via NodePort / Ingress

## Project Structure

Trend/
├── dist/                # Frontend build artifacts
│   ├── assets/
│   ├── index.html
│   └── vite.svg
├── k8s/                 # Kubernetes manifests
│   ├── deployment.yaml
│   ├── hpa.yaml
│   ├── ingress.yaml
│   └── service.yaml
├── .dockerignore
├── .gitignore
├── Dockerfile           # Container definition
├── Jenkinsfile          # CI/CD pipeline
├── main.tf              # Terraform infra code
├── iam-policy.json      # IAM Policy (non-sensitive version)
└── README.md            # Project documentation


## Usage Instructions

1. Clone the Repository
git clone https://github.com/<your-username>/trend-app.git
cd trend-app

2. Build and run the docker
docker build -t trend-app .
docker run -p 8080:80 trend-app

3. Provision Infrastructure with Terraform
terraform init
terraform plan
terraform apply

4. Deploy to Kubernetes
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/hpa.yaml
kubectl apply -f k8s/ingress.yaml

5. Access the Application
- Via NodePort → http://<EC2-Node-Public-IP>:<NodePort>
- http://k8s-trendapp-trending-c80c7ce2ef-1234567890.ap-south-1.elb.amazonaws.com

6. Autoscaling demo
The Horizontal Pod Autoscaler (hpa.yaml) is configured to scale pods between 2–5 replicas when CPU usage crosses 30%.
You can test load with:
kubectl exec -it load-generator -n trend-app -- /bin/sh
while true; do wget -q -O- http://trend-service:80/ > /dev/null; done

** License **
This project is licensed under the MIT License


