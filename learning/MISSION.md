# Mission: Docker and Kubernetes Orchestration

## Why
To gain hands-on experience with containerization and orchestration by building, dockerizing, and deploying a simple Spring Boot application to a local Kubernetes cluster (minikube). This practical knowledge will translate to real-world microservices deployment and scaling scenarios.

## Success looks like
- A working Spring Boot app with a simple REST endpoint
- Successfully containerized app (Docker image built and runs locally)
- Running the containerized app in minikube
- Understanding how Kubernetes orchestrates containers (pods, deployments, services)
- Ability to scale the application up/down using kubectl commands
- Clear mental model of: container → image → pod → deployment → service

## Constraints
- Keep the Spring Boot app minimal (single endpoint, no database)
- Use minikube for local Kubernetes learning
- Learning by doing - student writes code, teacher reviews progress via git
- Focus on practical understanding over theory

## Out of scope
- Production Kubernetes features (Ingress, ConfigMaps, Secrets, StatefulSets) - focus on fundamentals first
- CI/CD pipelines
- Multi-service architectures
- Cloud provider managed Kubernetes (EKS, GKE, AKS)
