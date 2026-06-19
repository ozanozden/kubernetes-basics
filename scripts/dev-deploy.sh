#!/bin/bash
set -e

# Development deployment script
# Use this after modifying the application code (Java files)
# It rebuilds the app, creates a new Docker image, and deploys it

echo "🔨 Rebuilding Application After Code Changes"
echo "=============================================="
echo ""

echo "📦 Building JAR..."
./gradlew clean bootJar
echo ""

echo "🐳 Building Docker image..."
docker build -t k8s-demo:latest .
echo ""

echo "📥 Loading into minikube..."
minikube image load k8s-demo:latest
echo ""

echo "🚀 Restarting Kubernetes deployment..."
kubectl rollout restart deployment/k8s-demo
echo ""

echo "⏳ Waiting for rollout to complete..."
kubectl rollout status deployment/k8s-demo
echo ""

echo "✅ Deployment complete!"
echo ""
kubectl get pods -l app=k8s-demo
echo ""
echo "Your code changes are now live in Kubernetes!"
echo ""
echo "Test the app:"
echo "  kubectl port-forward service/k8s-demo-service 8080:8080"
echo "  curl http://localhost:8080/hello"
echo ""
