# 🚀 Learn Kubernetes by Doing

A **hands-on Kubernetes tutorial** where you learn by deploying a real application. No theory-first. No slides. Just you, kubectl, and a running app.

**Perfect for:** Junior developers with basic Docker knowledge who want to learn Kubernetes fundamentals.

---

## 🎯 What You'll Learn

By completing this tutorial, you'll understand:
- ✅ How Kubernetes orchestrates containers (Pods, Deployments, Services)
- ✅ How to make apps production-ready (health checks, resource limits)
- ✅ How to manage configuration and secrets without rebuilding images
- ✅ How to debug, scale, and update applications in Kubernetes

**No Spring Boot or Docker experience needed** - the app is ready to use.

---

## 📚 5 Progressive Lessons

| Lesson | Kubernetes Concept | Time | What You'll Learn |
|--------|-------------------|------|-------------------|
| **[Lesson 1](learning/lessons/lesson-1-kubernetes-basics.html)** | Pods, Deployments, Services | 15 min | Deploy a 2-replica app, expose it via Service |
| **[Lesson 2](learning/lessons/lesson-2-health-checks.html)** | Liveness & Readiness Probes | 20 min | Add Actuator, configure health probes, rebuild & deploy |
| **[Lesson 3](learning/lessons/lesson-3-resources.html)** | Resource Limits | 10 min | Prevent resource starvation with CPU/memory limits |
| **[Lesson 4](learning/lessons/lesson-4-config.html)** | ConfigMaps | 20 min | Add config endpoint, externalize config, rebuild & deploy |
| **[Lesson 5](learning/lessons/lesson-5-secrets.html)** | Secrets | 20 min | Add secrets endpoint, handle sensitive data, rebuild & deploy |

**Total time:** ~85 minutes to go from zero to production-ready Kubernetes knowledge.

**What makes this different:**
- ✅ Complete development workflow: code → test locally → rebuild → deploy
- ✅ Not just K8s manifests - you'll modify Java code, add dependencies, rebuild Docker images
- ✅ Understand the FULL cycle: from code change to running in Kubernetes

---

## 📋 Prerequisites

- **Docker Desktop** - [Download](https://www.docker.com/products/docker-desktop)
- **Minikube** - `brew install minikube` (Mac) or [Install guide](https://minikube.sigs.k8s.io/docs/start/)
- **kubectl** - Comes with Docker Desktop
- **Basic Docker knowledge** - What containers are, what images are (5 min crash course below)

### 5-Minute Docker Crash Course

If you're completely new to Docker:
- **Container** = Running instance of your app (like a process)
- **Image** = Blueprint for containers (like an executable file)
- **Docker builds images** from a `Dockerfile`
- **Kubernetes orchestrates containers** (many containers across many machines)

**That's all you need!** The rest is Kubernetes.

---

## ⚡ Quick Start

### Two Learning Paths

Choose your approach:

#### Path 1: Learn by Building (Recommended)
Start with **minimal code** and build up through the lessons:

```bash
# Clone the repo
git clone https://github.com/ozanozden/kubernetes-basics.git
cd kubernetes-basics

# Checkout the init branch (minimal starting state)
git checkout init

# Run setup script
./scripts/setup.sh
```

**What you get:**
- Minimal Spring Boot app (only `/hello` endpoint)
- No Kubernetes manifests
- No actuator, no config handling
- You'll add everything through lessons 1-5

**Start here:** [Lesson 1](learning/lessons/lesson-1-kubernetes-basics.html)

#### Path 2: Learn by Exploring
Start with the **finished application** and explore:

```bash
# Clone the repo
git clone https://github.com/ozanozden/kubernetes-basics.git
cd kubernetes-basics

# Stay on main branch (finished state)
# Run setup script
./scripts/setup.sh
```

**What you get:**
- Complete Spring Boot app with all endpoints
- All Kubernetes manifests (deployment, service, configmap, secret)
- Production-ready configuration
- You'll explore and understand how it all works

Both paths use the same lessons - choose based on your learning style!

---

## 🎓 Teaching Philosophy

This tutorial follows a unique approach:

1. **Kubernetes First** - Focus on K8s concepts, not Spring Boot internals
2. **Complete Workflow** - Code changes → local testing → Docker rebuild → K8s deploy
3. **Hands-On** - You'll type commands, see results, break things, fix them
4. **Production-Ready** - Learn patterns used in real applications

Read more: [TEACHING-APPROACH.md](TEACHING-APPROACH.md)

---

## 🛠️ The Demo Application

A minimal Spring Boot REST API with these endpoints:

```bash
GET /hello              # Returns "Hello from Kubernetes!"
GET /config             # Shows ConfigMap values (Lesson 4)
GET /secrets            # Shows masked secrets (Lesson 5)
GET /actuator/health    # Health check endpoint (Lesson 2)
```

**You don't need to understand Spring Boot.** The app is just a vehicle for learning Kubernetes concepts.

### Want to Modify the App?

The app code is in `src/main/java/com/backend/k8sdemo/web/HelloController.java`.

After editing:
```bash
./scripts/dev-deploy.sh  # Rebuilds & redeploys automatically
```

But **this is optional** - you can complete all lessons without touching Java code.

---

## 📁 Project Structure

```
k8s-demo/
├── learning/
│   ├── README.md                 # Start here
│   ├── lessons/
│   │   ├── lesson-1-kubernetes-basics.html
│   │   ├── lesson-2-health-checks.html
│   │   ├── lesson-3-resources.html
│   │   ├── lesson-4-config.html
│   │   └── lesson-5-secrets.html
│   └── reference/                # Deep-dive references
│
├── k8s-manifests/                # Reference manifests (DON'T PEEK!)
│   ├── 01-basics/                  Use these only if stuck
│   ├── 02-health-checks/
│   ├── 03-resources/
│   ├── 04-config/
│   └── 05-secrets/
│
├── scripts/
│   ├── setup.sh                  # One-time setup
│   ├── deploy-lesson.sh          # Deploy reference solution
│   └── dev-deploy.sh             # Rebuild after code changes
│
├── src/                          # Spring Boot app (pre-built)
└── Dockerfile                    # Multi-stage build (pre-written)
```

**Learning workflow:**
1. Read lesson
2. Write your own `k8s/deployment.yaml` and `k8s/service.yaml`
3. Deploy: `kubectl apply -f k8s/`
4. Experiment with `kubectl` commands
5. Stuck? Check `k8s-manifests/XX-lesson-name/` for reference

---

## 🎓 After Completing This Tutorial

You'll have hands-on experience with:
- ✅ Writing Deployment and Service manifests
- ✅ Using kubectl to manage applications
- ✅ Debugging pods with `kubectl describe`, `kubectl logs`
- ✅ Configuring health checks for production apps
- ✅ Managing resources to prevent cluster issues
- ✅ Handling configuration and secrets properly

**Next steps:**
- Learn **Ingress** (HTTP routing for multiple services)
- Explore **StatefulSets** (for databases with persistent storage)
- Try **Helm** (Kubernetes package manager)
- Deploy to a real cloud cluster (EKS, GKE, AKS)

---

## 🐛 Troubleshooting

**Minikube won't start?**
```bash
minikube delete
minikube start
./scripts/setup.sh  # Rebuild and reload
```

**Image not found in Kubernetes?**
```bash
minikube image load k8s-demo:latest
kubectl rollout restart deployment/k8s-demo
```

**Want to start a lesson over?**
```bash
kubectl delete all --all  # Clean slate
./scripts/deploy-lesson.sh 01  # Deploy reference solution
```

**Stuck on a lesson?**
- Check `k8s-manifests/XX-lesson/` for reference solutions
- Or deploy it: `./scripts/deploy-lesson.sh 01`

---

## 🤝 Contributing

Found this helpful? **Star the repo!** ⭐

Found a bug or typo? **Open an issue or PR.**

Want to add Lesson 6 (Ingress) or Lesson 7 (Persistent Volumes)? **PRs welcome!**

---

## 📝 License

MIT - Learn freely, build confidently!

---

**Ready to start?**

```bash
./scripts/setup.sh
open learning/lessons/lesson-1-kubernetes-basics.html
```

**Let's learn Kubernetes by doing!** 🚀
