# 🌐 Lab: Expose Your Application with Services and Ingress

In this lab, you'll learn how to expose your Kubernetes applications internally and externally using **Service** and **Ingress** resources.

This lab builds on your Pod and Deployment knowledge and introduces basic networking concepts essential for real-world use and certification prep.

---

## 🎯 Objectives

By the end of this lab, you will:

- Create a Kubernetes `Service` of type `ClusterIP` and `NodePort`
- Understand how internal service discovery works
- Deploy the NGINX Ingress Controller
- Create an `Ingress` resource to route external HTTP traffic to your app

---

## 🛠 Prerequisites

- A Kubernetes cluster created with `kind` and configured for Ingress:
  1. Use [kind-config.yaml](kind-config.yaml) provided in this repo:
     ```bash
     kind create cluster --config kind-config.yaml --name grow-lab
     ```
  2. Install the NGINX Ingress Controller:
     ```bash
     kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.4/deploy/static/provider/kind/deploy.yaml
     ```

- Files provided:
  - [web-pod.yaml](web-pod.yaml)
  - [web-service.yaml](web-service.yaml)
  - [web-ingress.yaml](web-ingress.yaml)

---

## ✅ Part 1: Deploy the Pod and Service

Apply the Pod and Service:

```bash
kubectl apply -f web-pod.yaml
kubectl apply -f web-service.yaml
```

Check if the Pod is running:

```bash
kubectl get pods
kubectl get svc
```

Try reaching the Service using `curl` with port forwarding:

```bash
kubectl port-forward svc/web 8080:80
curl http://localhost:8080
```

---

## ✅ Part 2: Apply the Ingress Resource

Apply the Ingress:

```bash
kubectl apply -f web-ingress.yaml
```

Update your `/etc/hosts` file:

```
127.0.0.1 web.example.com
```

Then test:

```bash
curl http://web.example.com
```

---

## 🧠 Reflect in Your Notebook

Open `99-reflections/week4.md`


## What I Learned
- How to expose a Pod using a Service
- What Ingress does and how it maps URLs to Services

## What Was Challenging
- Understanding the roles of NodePort vs ClusterIP vs Ingress
- Installing the NGINX Ingress Controller

## Commands I Practiced
```bash
kubectl apply -f web-pod.yaml
kubectl apply -f web-service.yaml
kubectl apply -f web-ingress.yaml
```

## Networking Insights
- Learned how DNS and routing work inside a cluster
- Used `kubectl port-forward` to debug before setting up Ingress


---

## 📝 Commit Your Configuration

```bash
git add 04-networking/
git commit -m "Add service and ingress lab"
git push origin main
```

---

## 📣 Share Your Work

Post a screenshot of `curl http://web.example.com` using:
- 🏷 `#KubeSkillsGROW`
- 🏷 `#K8sIngress`

---

## 🔁 Next Step

Ready to work with state in Kubernetes?
👉 Continue to [Deploying a Stateful Application that requires persistent Storage](../05-stateful-deploy/lab-guide.md)