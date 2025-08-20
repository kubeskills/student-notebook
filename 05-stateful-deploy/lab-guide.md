# 🗃️ Lab: Use PersistentVolumeClaims to Run a Stateful App

In this lab, you'll deploy a stateful application (PostgreSQL) that requires persistent storage. You'll learn how to create a `PersistentVolumeClaim` (PVC), bind it to a Deployment, and understand how Kubernetes handles durable storage.

---

## 🎯 Objectives

By the end of this lab, you will:

- Understand PersistentVolume (PV) and PersistentVolumeClaim (PVC)
- Define and bind a PVC to a pod
- Deploy PostgreSQL using persistent storage
- Reflect on pod lifecycle and data durability

---

## 🛠 Prerequisites

- Kubernetes cluster with default `StorageClass`
- `kubectl` access
- Files included:
  - `postgres-pvc.yaml`
  - `postgres-deployment.yaml`

---

## ✅ Part 1: Create a PVC

```bash
kubectl apply -f postgres-pvc.yaml
kubectl get pvc
```

Check the status:
```bash
kubectl describe pvc postgres-pvc
```

---

## ✅ Part 2: Deploy PostgreSQL with PVC

```bash
kubectl apply -f postgres-deployment.yaml
```

Check if the pod is running:

```bash
kubectl get pods
kubectl describe pod postgres
```

---

## ✅ Part 3: Connect and Inspect

Create the postgres service:

```bash
kubectl apply -f postgres-svc.yaml
```

Port-forward to connect:

```bash
kubectl port-forward svc/postgres 5432:5432
```

Then from another terminal, use `psql` or a PostgreSQL client to verify the DB is running.

```bash
sudo apt install postgresql-client-16 -y

psql -h localhost -p 5432 -U postgres

postgres=# \l
```

expected output:
```
   Name    |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | ICU Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+------------+------------+------------+-----------+-----------------------
 postgres  | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           | 
 template0 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           | =c/postgres          +
           |          |          |                 |            |            |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           | =c/postgres          +
           |          |          |                 |            |            |            |           | postgres=CTc/postgres
(3 rows)
```

---

## 🧠 Reflect in Your Notebook

Open: `99-reflections/week5.md`

```markdown
## What I Learned
- How a PVC binds to a Pod and provides storage
- What happens to volumes when pods are restarted

## What Was Challenging
- Understanding accessModes and reclaimPolicy
- Verifying PVC actually mounted into the container

## Commands I Practiced
```bash
kubectl apply -f postgres-pvc.yaml
kubectl apply -f postgres-deployment.yaml
kubectl get pvc
kubectl describe pod postgres
```

## Real-World Relevance
- Nearly every app needs state. This shows how Kubernetes supports it.
```

---

## 📝 Commit Your Work

```bash
git add 05-storage/
git commit -m "Add persistent storage lab with PostgreSQL"
git push origin main
```

---

## 📣 Share

Post a screenshot of your PVC and Pod running with:
- 🏷 `#KubeSkillsGROW`

---

## 🔁 Bonus

Try scaling the PostgreSQL deployment. What happens to the PVC?

```bash
kubectl scale deployment postgres --replicas=2
```

Hint: Stateful apps often need `StatefulSets`, not `Deployments`!

## ⏩ Next Step

Ready to customize your shell?
👉 Continue to  [Playing your computer like an instrument](../06-playing-your-computer-as-an-instrument/lab-guide.md)