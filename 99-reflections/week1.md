# Week 1 Reflection – NGINX Pod and Deployment

This week, I worked through the Kubernetes fundamentals lab where I deployed a basic NGINX web server using both a Pod and a Deployment. I also learned about security contexts and how to scale workloads.

---

## ✅ What I Learned

- Pods are single units; Deployments manage replicas and scaling (rollout strategies)
- Security contexts is the first line of defense for controlling how containers behave from a security standpoint. It defines privilege and       access control settings for a Pod or its individual containers
- Deploy contains 1 or more pods
- Deployment availability depends on pods availability. If a pod is no running, it deployment would not run as well.


---

## ❓ What Was Challenging

- Getting the pods and deployment to be available (running) without compromising the security.
- Error: container has runAsNonRoot and image will run as root (pod: "nginx-deployment-dcb68cf9f-fnx7j_default(65476189-63a9-4c3a-a9e2-20a077318343)", container: nginx)

---

## 🧪 Commands I Practiced

```bash
kubectl apply -f nginx-pod.yaml
kubectl apply -f nginx-deployment.yaml
kubectl get pods
kubectl get deployment
kubectl describe pods nginx
kubectl describe deployment nginx-deployment
kubectl scale deployment nginx-deployment --replicas=3

```

---

## 🔐 Security Improvements I Made

- Set `runAsNonRoot` to `true` to ensures the container runs as a non-root user 
- Set `allowPrivilegeEscalation` to `false` to prevents the container from gaining additional privileges

---

## 📝 Questions I Still Have

- How do I get the pods and deployment running (available) without compromising the security.
- How do i fix the error from the `kubectl describe pods` command
- Error:

``` 
Error: container has runAsNonRoot and image will run as root (pod: "nginx-deployment-dcb68cf9f-fnx7j_default(65476189-63a9-4c3a-a9e2-20a077318343)", container: nginx)
```
---

## 📎 Related YAMLs

- `nginx-pod.yaml`
- `nginx-deployment.yaml`

---

## 🚀 Looking Ahead

I’m excited to explore GitOps in Week 2 and automate deployments using FluxCD.

