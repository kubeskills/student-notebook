# 🔄 Keeping Your Fork in Sync

If you forked the `student-notebook` repository, you’ll want to regularly pull in updates from the original repo. Here’s how:

---

## 1. Add the upstream remote

```bash
git remote add upstream https://github.com/kubeskills/student-notebook.git
```

Verify the remotes:

```bash
git remote -v
```

---

## 2. Fetch the latest changes

```bash
git fetch upstream
```

---

## 3. Merge changes into your main branch

Switch to your local main branch:

```bash
git checkout main
git merge upstream/main
```

> ✅ Tip: Use `--ff-only` to avoid accidental merge commits:

```bash
git merge --ff-only upstream/main
```

---

## 4. Push the updates to your GitHub fork

```bash
git push origin main
```

---

Now your fork is synced and you’ll get all the latest labs, reflection templates, and MkDocs updates.
