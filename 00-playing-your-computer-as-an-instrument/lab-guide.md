# 🗃️ Lab: Shell DX for Kubernetes (Zsh Edition)

Getting fast at the shell is the fastest way to get fast at Kubernetes. The goals here are simple: fewer keystrokes, better context‑awareness (cluster/namespace), and safer defaults.


---

## 🎯 Objectives

By the end of this lab, you will:
- Enable zsh with completions, history search, and syntax assists.
- See your current Kubernetes context/namespace in the prompt.
- Install kubectl plugins via krew and add sane aliases.

---

## 🛠 Prerequisites

Adjust package manager paths as needed for your OS.
```zsh
# Zsh + helpers
brew install zsh fzf starship zsh-autosuggestions zsh-syntax-highlighting bat jq yq
```

```zsh
# Kubernetes helpers:
brew install kubectx kubens

# Oh-My-Zsh Plugins
plugins=(git kubectl kubectx dirhistory)
```

Enable fzf keybindings:
```zsh
"$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc
```

Make zsh your default shell
```zsh
chsh -s $(which zsh)
```
Log out/in to apply.


```bash

```

---

## ✅ Part 1: Install Oh My Zsh


### Step 1: Install Zsh via curl or wget

Follow the official guide: [https://ohmyz.sh/#install](https://ohmyz.sh/#install)
```zsh
# curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# or wget
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```


### Step 2: Configure Zsh History

**ZSH History Configuration**

Add the following to your `.zshrc` to configure ZSH history:
```zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
```

**Install atuin**
```bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

**Atuin for Shell History**
```zsh
eval "$(atuin init zsh --disable-up-arrow)"
```

---

## ✅ Part 2: Prompt awareness with Starship (Kubernetes module)

### Step 1: Configure Starship

Docs: [https://starship.rs](https://starship.rs)

Add the following to your `~/.config/starship.toml`:
```toml
[kubernetes]
format = 'on [⛵ ($user on )($cluster in )$context \($namespace\)](dimmed green) '
disabled = false
```

### Step 2: Add to your Zsh

In `.zshrc`:
```zsh
source <(/opt/homebrew/bin/starship init zsh --print-full-init)
```


---

## ✅ Part 3: Zsh: completion, autosuggestions, syntax highlighting

### Step 1: ZSH Completion

Make sure completion runs before plugins, and syntax‑highlighting loads last.
```bash
# in `~.zshrc`
autoload -U compinit; compinit

# zsh Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
```

### Step 2: Kubectl completion + aliases

```zsh
# completion
source <(kubectl completion zsh)
compdef _kubectl k

# aliases that don't hide intent but cut keystrokes
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kga='kubectl get all'
alias kgn='kubectl get nodes -o wide'
alias kgp='kubectl get pods -o wide'
alias kl='kubectl logs'
alias kx='kubectl exec -it'
alias kctx='kubectx'
alias kns='kubens'

# safer default: dry-run prints YAML you can pipe to a file
alias kap='kubectl apply -f'
alias kdry='kubectl -o yaml --dry-run=client'
```

---

## ✅ Part 4: krew (kubectl plugin manager) + must‑have plugins

### Step 1: Krew kubectl plugin manager
```zsh
(
  set -euo pipefail
  cd "$(mktemp -d)"
  OS="$(uname | tr '[:upper:]' '[:lower:]')"
  ARCH="$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/;s/armv.*/arm/')"
  KREW="krew-${OS}_${ARCH}"
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz"
  tar zxvf "${KREW}.tar.gz"
  ./"${KREW}" install krew
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```

### Step 2: Recommended plugins

```zsh
kubectl krew install ctx ns           # context/namespace (kubectx/kubens equivalents)
kubectl krew install neat             # clean up JSON/YAML output
kubectl krew install view-secret      # decode secrets safely
kubectl krew install who-can          # RBAC: who can do what?
kubectl krew install sniff            # tcpdump/wireshark on pods (when allowed)
kubectl krew install stern            # multi-pod logs with selectors

```

**Examples:**
```zsh
k ctx            # switch cluster
k ns dev         # switch namespace
k get deploy -o json | kubectl neat | bat -l yaml
kubectl who-can get pods
stern -n api 'gateway-.*'

```

---

## ✅ Part 5: Quality-of-life env and editor

### Step 1: Default Editor

Set your default editor for `kubectl edit`:
```zsh
export KUBE_EDITOR=nvim
```

### Step 2: Merge kubeconfigs
```zsh
# merge kubeconfigs (useful for kind/test clusters)
export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/configs/dev:$HOME/.kube/configs/test

# shorter, human-first output (falls back if `bat` not installed)
command -v bat >/dev/null || alias bat='cat'
```

### Step 3: Optional niceties
- `kubectx`/`kubens` binaries (already installed via brew): lightning‑fast ctx/ns switching.
- `zoxide` (cd on steroids): `brew install zoxide` then `eval "$(zoxide init zsh)"`.
- direnv for per‑project env (e.g., custom `KUBECONFIG` in a repo): `brew install direnv` and hook in `.zshrc`.

---


## ✅ Part 6: A clean, copy‑paste `.zshrc` (starter)

[.zshrc](.zshrc)


## ✅ Part 7: Habits & Troubleshooting

### Step 1: Safety & speed habits (muscle memory)

- Always generate first, apply second: `k create deploy web --image=nginx --dry-run=client -o yaml | bat -l yaml` → `then kap -`
- Use labels from day one: `-l app=web`, then `stern -l app=web`, `k get po -l app=web`.
- Pipe to `neat` when you’re drowning in fields: `k get po -o json | kubectl neat | bat -l yaml`.


## Step 2: Troubleshooting gotchas

- Starship not showing k8s module? Ensure `kubectl` is in `PATH` and you have a current context (`kubectl config current-context`).
- Syntax highlighting not working? It must be sourced last in `.zshrc`.
- Completions flaky? Run `rm -rf ~/.zcompdump* && compinit -i`.



---


## 🧠 Reflect in Your Notebook

Update `99-reflections/week6.md` with:

### What I Learned
- “I didn’t realize how much my shell history could improve my productivity. With Atuin, I don’t have to re-Google or re-type commands I ran months ago.”
- “Customizing the shell makes Kubernetes feel less overwhelming—kubectx and starship give me quick awareness of cluster/namespace so I avoid mistakes.”
- “History sharing across terminals is underrated. Now I can close a window without losing the command I just ran.”
- “At first, I thought kubectl was just about memorizing commands. Now I see the importance of building a workflow around it.”
- “Using auto-completion and syntax highlighting reduced my typos and helped me learn resource names faster.”
- “I feel more confident experimenting because I know I can find past commands if something worked before.”

### Reflections on Developer Experience (DX)

- “The shell feels like a personal instrument now—tuned to me. It’s motivating to treat the CLI as part of my craft.”
- “Even though Kubernetes itself is complex, improving my DX makes me feel more in control.”
- “I can already see how this setup will save time when switching between multiple projects or clusters.”

### Looking Forward

- “I wonder what other plugins or tools I could add once I get comfortable with this setup.”

- “How do experienced SREs and platform engineers customize their shell differently than beginners?”

- “This makes me want to version-control my dotfiles so I can carry my environment everywhere.”


---

## 📣 Share Your Progress

Post a screenshot or summary, and get featured using:
- 🏷 `#KubeSkillsGROW`
- Tag [@KubeSkills](https://linkedin.com/company/kubeskills)

---

## 🔁 Next Step

Add your own `lab-guide.md` and build your portfolio custom to you. Follow the [Contributing Guide](../CONTRIBUTING.md) for ideas 💡!