# 📦 Lab: Deploy a Basic NGINX Pod and Deployment

In this lab, you'll deploy a simple NGINX web server as a **Pod** and a **Deployment**. You'll learn the difference between the two, apply security best practices, and reflect on your learning.

---

## 🎯 Objectives

By the end of this lab, you will:

- Understand the difference between a [Pod](https://kubernetes.io/docs/concepts/workloads/pods/) and a [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- Use `kubectl` to apply, inspect, and delete resources
- Add a `securityContext` to enhance workload security
- Commit your work and reflect in your learning notebook

---

## 🛠 Prerequisites

- A local Kubernetes cluster (e.g., `kind create cluster --name grow-lab`)
- `kubectl` installed and working
- This directory should contain:
  - [nginx-pod.yaml](nginx-pod.yaml)
  - [nginx-deployment.yaml](nginx-deployment.yaml)

---

## ✅ Part 1: Deploy a Standalone Pod

### Step 1: Apply the Pod

```bash
kubectl apply -f nginx-pod.yaml
```

Verify it’s running:

```bash
kubectl get pods
kubectl describe pod nginx
```

---

### Step 2: Add Security Context to the Pod

In `nginx-pod.yaml`, update the container spec:

```yaml
securityContext:
  runAsNonRoot: true
  allowPrivilegeEscalation: false
```
> HINT: See the [Kubernetes Docs](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for help.

Re-apply the file:

```bash
kubectl apply -f nginx-pod.yaml
```

---

## ✅ Part 2: Deploy Using a Deployment Resource

### Step 1: Apply the Deployment

```bash
kubectl apply -f nginx-deployment.yaml
```

Inspect it:

```bash
kubectl get deployments
kubectl get pods
kubectl describe deployment nginx-deployment
```

---

### Step 2: Scale the Deployment

```bash
kubectl scale deployment nginx-deployment --replicas=3
kubectl get pods
```

---

## 📝 Commit Your Work

```bash
git add nginx-pod.yaml nginx-deployment.yaml
git commit -m "Add NGINX pod and deployment with securityContext"
git push origin main
```

---

## 🧠 Reflect in Your Notebook

Update `99-reflections/week1.md` with:

## What I Learned
- Pods are single units; Deployments manage replicas and rollout strategies
- Security contexts improve workload isolation

## What Was Challenging
- Understanding why the Pod didn’t start when missing the image tag
- The difference between `kubectl get pod` and `kubectl get deployment`

## Commands I Practiced
```bash
kubectl apply -f nginx-pod.yaml
kubectl apply -f nginx-deployment.yaml
kubectl get pods
kubectl describe deployment nginx-deployment
kubectl scale deployment nginx-deployment --replicas=3
```

## Security Improvements I Made
- Set `runAsNonRoot` and disabled privilege escalation


---

## 📣 Share Your Progress

Post a screenshot or summary using:
- 🏷 `#KubeSkillsGROW`
- Tag [@KubeSkills](https://linkedin.com/company/kubeskills)

---

## 🔁 Next Step

Ready to automate your deployments?  
👉 [Continue to GitOps with FluxCD](../02-gitops/lab-guide.md)
