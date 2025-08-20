# 📘 KubeSkills Student Notebook Template

Welcome to your **KubeSkills GitHub Repository of Work (GROW)** 🪴.

This is your personal portfolio to document everything you learn through Kubernetes labs, YAML exercises, and weekly reflections.

> ✅ Fork this repo to get started and prove what you know—one commit at a time.

---

## 🚀 Your First Tasks

1. ✅ Fork this repository to your own GitHub account.
2. ✅ Open [00-getting-started/lab-notes.md](00-getting-started/lab-notes.md) and follow the instructions.
3. ✅ Complete the first lab in `01-kubernetes-fundamentals/`.
4. ✅ Create a new reflection file in `99-reflections/week1.md`.
5. ✅ Commit and push your changes to GitHub.
6. ✅ Share your work using `#KubeSkillsGROW` and tag [@KubeSkills](https://linkedin.com/company/kubeskills).

---

## 📁 Suggested Folder Structure

```
student-notebook/
├── 00-getting-started/
│   └── lab-notes.md
├── 01-kubernetes-fundamentals/
│   ├── lab-guide.md
│   ├── nginx-deployment.yaml
│   ├── nginx-pod.yaml
│   └── pod-example.yaml
├── 02-gitops/
│   └── lab-guide.md
├── 03-security/
│   ├── lab-guide.md
│   ├── network-policy.yaml
│   ├── pod-security-context.yaml
│   └── secure-pod.yaml
├── 04-services-ingress/
│   ├── kind-config.yaml
│   ├── lab-guide.md
│   ├── web-ingress.yaml
│   ├── web-pod.yaml
│   └── web-service.yaml
├── 05-stateful-deploy/
│   ├── lab-guide.md
│   ├── postgres-deployment.yaml
│   ├── postgres-pvc.yaml
│   └── postgres-svc.yaml
├── 99-reflections/
│   ├── week1.md
│   ├── week2.md
│   ├── week3.md
│   ├── week4.md
│   └── week5.md
├── docs/
│   └── index.md
├── mkdocs.yml
└── README.md
```



---

## ✅ What You’ll Gain

- A real-world Kubernetes portfolio
- Practice using kubectl, YAML, Helm, and GitOps tools
- Security-first awareness in your Kubernetes configs
- Confidence in sharing and reflecting on your growth

---

## 📣 Want to Share Your Work?

- Add a badge to your repo:
```markdown
![GROW Portfolio](https://img.shields.io/badge/GROW-portfolio-blue)
```

- Tag your posts with: `#KubeSkillsGROW` `#KubeSkills`  
- Email us your notebook to get featured: notebooks@kubeskills.com

---

## 🛡 License

This repo is licensed under the [MIT License](LICENSE).


---

## 🔁 Keep Your Fork In-sync

👉 [Add upstream remote, fetch and merge](updating-your-fork.md)


---

## 🤝 Want to Contribute?

We welcome your reflections, labs, and questions.

👉 [Read the Contribution Guide](CONTRIBUTING.md)

Whether it's fixing a typo or adding a new tutorial, your contributions help everyone GROW. 🌱



---

## ❓ Have a Question? Submit a PR!

If you hit a roadblock or you're unsure about something you learned:

1. Open a file like `99-reflections/weekX.md` or create a new `questions/question.md`.
2. Add your question and context—what you tried, what you expected, and what confused you.
3. Submit a Pull Request titled: `question: [Your Topic]`

Our instructors will respond directly in the PR or guide you to the right resource. Asking questions is part of the learning process—lean into it!

---

## 🌐 How to Publish Your Portfolio with GitHub Pages

Want to turn your notebook into a live website? Follow these steps:

### ✅ Step 1: Install MkDocs

```bash
pip install mkdocs mkdocs-material
```

### ✅ Step 2: Preview Your Site Locally

```bash
mkdocs serve
```
Then visit: http://localhost:8000

### ✅ Step 3: Enable GitHub Pages

1. Go to Settings > Pages in your GitHub repo
2. Under Source, select:
 - Branch: main
 - Folder: /docs
3. Visit your new site at:
```
https://<your-username>.github.io/student-notebook/
```

