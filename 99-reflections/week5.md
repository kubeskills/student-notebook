# 📓 Week 5 Reflection — Working with Persistent Storage

In Week 5 of the GROW program, you explored how to bind persistent storage to a Kubernetes workload using a PersistentVolumeClaim (PVC). This week focused on stateful applications and storage durability.

---

## ✅ What I Learned

Reflect on what new concepts or tools you discovered this week. Some prompts to consider:

- 
- 
- 

_Example:_
> I learned that PVCs allow pods to retain data even after restarts. I also realized that `ReadWriteOnce` only allows one pod to mount the volume at a time.


---


## ❓ What Was Challenging

Think about what tripped you up or took extra time to understand.

_Example:_
> I had trouble understanding the lifecycle of a PVC and what happens when I delete the pod. I also wasn’t sure how to check if the volume was really mounted.


---


## 🔍 Commands I Practiced

```bash

```

---

## 💡 Real-World Takeaways

Would this apply in a real job or DevOps situation? Why or why not?

*Example:*

> I now understand how to run a database inside a Kubernetes deploymnet with data that persists. Is this essential for production environments like running PostgreSQL or Redis?


---


## 📣 What I Shared

Did you post anything on LinkedIn or BlueSky?


Paste the link or describe what you shared below:

✅ Shared a screenshot of my PVC running on LinkedIn with #GROWportfolio  


---


## 🧠 Questions I Still Have

Don’t hold back—ask anything you’re still curious or confused about.

*Example:*

> How do I use a StatefulSet for PostgreSQL instead of a Deployment?
> What happens if the node storing the PVC fails?

---

Keep pushing! You're building more than YAML—you’re building proof of your skills.

