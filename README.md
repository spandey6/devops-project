# Sudu's devops-project

This project is my first project for devops. This file will have all the details of this project.
Below is the project structure example

devops-project/
├── app/                     # Node.js app
│   ├── Dockerfile
│   └── ...
├── .github/workflows/
│   └── ci-cd.yaml           # GitHub Actions pipeline
├── terraform/
│   ├── main.tf              # AWS infra (EKS, ECR, etc.)
│   ├── variables.tf
│   └── outputs.tf
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── README.md

Create a basic Node.js web app.
