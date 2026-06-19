#!/bin/bash
set -e

echo "🚀 K8s Demo - Initial Setup"
echo "=============================="
echo ""

# Check prerequisites
echo "📋 Checking prerequisites..."
command -v docker >/dev/null 2>&1 || { echo "❌ Docker is required but not installed. Aborting."; exit 1; }
command -v minikube >/dev/null 2>&1 || { echo "❌ Minikube is required but not installed. Aborting."; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo "❌ kubectl is required but not installed. Aborting."; exit 1; }
echo "✅ All prerequisites found!"
echo ""

# Check if minikube is running
echo "🔍 Checking minikube status..."
if ! minikube status >/dev/null 2>&1; then
    echo "⚠️  Minikube is not running. Starting minikube..."
    minikube start
    echo "✅ Minikube started!"
else
    echo "✅ Minikube is running!"
fi
echo ""

# Build the application
echo "🔨 Building Spring Boot application..."
./gradlew clean bootJar
echo "✅ Application built!"
echo ""

# Build Docker image
echo "🐳 Building Docker image..."
docker build -t k8s-demo:latest .
echo "✅ Docker image built!"
echo ""

# Load image into minikube
echo "📦 Loading image into minikube..."
minikube image load k8s-demo:latest
echo "✅ Image loaded!"
echo ""

echo "🎉 Setup complete!"
echo ""
echo "You're ready to start learning Kubernetes!"
echo ""
echo "Quick start:"
echo "  1. Read lessons/lesson-01-basics.md"
echo "  2. Deploy: ./scripts/deploy-lesson.sh 01"
echo "  3. Explore with kubectl!"
echo ""
