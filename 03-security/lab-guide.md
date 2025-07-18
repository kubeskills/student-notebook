# 🔐 Lab: Apply Security Contexts and Strengthen Kubernetes Pod Security

In this lab, you'll explore how to secure workloads in Kubernetes using `securityContext` and Pod-level controls. You’ll apply both **preventive** and **defensive** configurations to reduce your pod's attack surface.

> “Security should be built-in, not bolted on.”

---

## 🎯 Objectives

By the end of this lab, you will:

- Understand the role of `securityContext` and Pod hardening
- Apply a Pod manifest with non-root enforcement
- Learn the purpose of privilege, capabilities, and file system settings
- Reflect on real-world attack mitigation via pod isolation

---

## 🛠 Prerequisites

- A Kubernetes cluster (`kind`, `k3s`, etc.)
- `kubectl` access
- File: [secure-pod.yaml](secure-pod.yaml)

---

## ✅ Part 1: Review the Threat Model

Before applying anything, answer these:

- What happens if a container runs as root?
- What if an attacker escapes the container namespace?
- What can be done to restrict file system access?

Keep these in mind during the lab!

---

## ✅ Part 2: Apply a Secure Pod Configuration

Review and apply the example `secure-pod.yaml`:

```bash
kubectl apply -f secure-pod.yaml
```

Key settings inside this manifest:

```yaml
securityContext:
  runAsNonRoot: true
  runAsUser: 1000
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - ALL
```

Then verify:

```bash
kubectl get pod secure-pod
kubectl describe pod secure-pod
```

> 📌 **Try breaking it**: edit the YAML to remove `runAsNonRoot`, and see if it behaves differently.

> HINT: Use the [Kubernetes docs](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for help.

---

## ✅ Part 3: Add [Pod Security Admission](https://kubernetes.io/docs/concepts/security/pod-security-admission/) Rules (Optional)

If using Kubernetes v1.25+, test the `PodSecurity` built-in admission controller:

```bash
kubectl label namespace default pod-security.kubernetes.io/enforce=baseline
```

Then re-apply the pod and see if it passes. Test with a bad config too!

---

## 🔍 Optional Exploration: Use Falco or Kyverno

- Install [Falco](https://falco.org/docs/getting-started/) and run your pod again to observe runtime alerts.
- Write a simple [Kyverno](https://kyverno.io/policies/pod-security/) policy to deny privileged containers.


> Complete this optional exercise for a bonus `Security Explorer` GROW badge. Email notebook@kubeskills.com for details.

---

## 🧠 Reflect in Your Notebook

Open: `99-reflections/week3.md`

## What I Learned
- How to apply and verify Kubernetes `securityContext` fields
- What `allowPrivilegeEscalation: false` really protects

## What Was Challenging
- Understanding which settings are container-level vs pod-level
- Interpreting PodSecurity admission errors

## Commands I Practiced
```bash
kubectl apply -f secure-pod.yaml
kubectl label ns default pod-security.kubernetes.io/enforce=baseline
kubectl describe pod secure-pod
```

## Security Awareness Gained
- I now know how to reduce the attack surface of a container
- I practiced enforcing non-root, disabling privilege escalation, and using a read-only root filesystem


---

## 📝 Commit Your YAML

```bash
git add 03-security/secure-pod.yaml
git commit -m "Add secure pod with securityContext"
git push origin main
```

---

## 📣 Share Your Progress

Post your YAML snippet or terminal output using:
- 🏷 `#KubeSkillsGROW`
- 🏷 `#K8sSecurity`
- 🏷 `#KubeSkills`

Tag [@KubeSkills](https://linkedin.com/company/kubeskills) if you'd like it reshared!

---

## 🔁 Next Step

Ready to add networking to your apps in Kubernetes?  
👉 [Continue to Services and Ingress Labs](../04-services-ingress/lab-guide.md)