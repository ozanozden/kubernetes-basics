#!/bin/bash
set -e

LESSON=$1

if [ -z "$LESSON" ]; then
    echo "Usage: $0 <lesson-number>"
    echo ""
    echo "Available lessons:"
    echo "  01 - Basics (Deployment & Service)"
    echo "  02 - Health Checks (Liveness & Readiness Probes)"
    echo "  03 - Resources (CPU & Memory Limits)"
    echo "  04 - Config (ConfigMaps)"
    echo "  05 - Secrets (Sensitive Data)"
    echo ""
    echo "Example: $0 01"
    exit 1
fi

# Format lesson number with leading zero
LESSON_NUM=$(printf "%02d" $LESSON)

# Map lesson numbers to folder names
case $LESSON_NUM in
    01) LESSON_DIR="01-basics" ;;
    02) LESSON_DIR="02-health-checks" ;;
    03) LESSON_DIR="03-resources" ;;
    04) LESSON_DIR="04-config" ;;
    05) LESSON_DIR="05-secrets" ;;
    *)
        echo "❌ Unknown lesson: $LESSON_NUM"
        echo "Valid lessons: 01, 02, 03, 04, 05"
        exit 1
        ;;
esac

MANIFEST_DIR="k8s-manifests/$LESSON_DIR"

if [ ! -d "$MANIFEST_DIR" ]; then
    echo "❌ Lesson directory not found: $MANIFEST_DIR"
    exit 1
fi

echo "🚀 Deploying Lesson $LESSON_NUM: $LESSON_DIR"
echo "============================================"
echo ""

# Clean up previous deployment
echo "🧹 Cleaning up previous deployment..."
kubectl delete deployment k8s-demo 2>/dev/null || true
kubectl delete service k8s-demo-service 2>/dev/null || true
kubectl delete configmap k8s-demo-config 2>/dev/null || true
kubectl delete secret k8s-demo-secret 2>/dev/null || true
echo ""

# Apply all manifests in the lesson directory
echo "📝 Applying Kubernetes manifests..."
kubectl apply -f "$MANIFEST_DIR/"
echo ""

# Wait for deployment to be ready
echo "⏳ Waiting for deployment to be ready..."
kubectl rollout status deployment/k8s-demo --timeout=60s
echo ""

echo "✅ Lesson $LESSON_NUM deployed successfully!"
echo ""
echo "Useful commands:"
echo "  kubectl get pods              # See running pods"
echo "  kubectl get svc               # See services"
echo "  kubectl describe pod <name>   # Detailed pod info"
echo "  kubectl logs <pod-name>       # View pod logs"
echo "  kubectl port-forward service/k8s-demo-service 8080:8080  # Access the app"
echo ""
echo "Test the app:"
echo "  curl http://localhost:8080/hello"

if [ "$LESSON_NUM" = "04" ] || [ "$LESSON_NUM" = "05" ]; then
    echo "  curl http://localhost:8080/config"
fi

if [ "$LESSON_NUM" = "05" ]; then
    echo "  curl http://localhost:8080/secrets"
fi

echo ""
