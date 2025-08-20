# 🧪 Notes – Overview

Its important to work on your personal work flow with Kubernetes. Getting good at the command line will increase your productivity. 

I am a command line guy and have been for a long time. My prefered shell these days is [zsh](https://www.zsh.org/) and I use [oh-my-zsh](https://ohmyz.sh/) to organize it.

A big part of my own personal DX is to make heavy use of my zsh history. To manage my zsh history between computers and to basically capture every command I will ever run, I use [atuin](https://atuin.sh/) and the zsh history options below.  

This is important when using kubectl, but it is also important when standing up clusters in aws with the aws cli command, az in azure or gcloud in google. With atuin you can search through your zsh history to find that non-obvious command you ran two years ago. Atuin has fuzzy search making it easy to find what you are looking for. 

In addition to atuin, I configure my zsh shell to use auto-completion, syntax high-lighting, and kubectx or [starship](https.starship.rs/) for awareness of which cluster and namespace I am working on. 


The point of working on your personal developer experience and command line foo is to interact with your computer as if it were a beautiful instrument, a stradivarius if you will. Doing so will increase your productivity and generally improve your personal experience and work flow. 

---

## ✅ Goals
By the end of this section, you will:
- Gain an understanding of how to improve your personal DX

---

## 🛠️ Overview

### Step 1: Set ZSH as your default shell
Verify:
```bash
chsh -s $(which zsh)
```

### Step 2: Install oh-my-zsh
Follow the official guide:  
➡️ https://ohmyz.sh/#install

Install via curl
Verify:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install via wget
Verify:
```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
### Step 3: Configure ZSH

#### ZSH History Configuration
Add the following to your `.zshrc` to configure ZSH history:
```bash
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
```

#### Install atuin
```bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```


#### Atuin for Shell History
```bash
eval "$(atuin init zsh --disable-up-arrow)"
```

#### Kubectx for Kubernetes Context Switching
Install with Brew:
```bash
brew install kubectx
```

#### Oh-My-Zsh Plugins
```bash
plugins=(git kubectl kubectx dirhistory)
```

#### Starship Prompt
Add the following to your `~/.config/starship.toml`:
```toml
[kubernetes]
format = 'on [⛵ ($user on )($cluster in )$context \($namespace\)](dimmed green) '
disabled = false
```

And add this to your `.zshrc`:
```bash
source <(/opt/homebrew/bin/starship init zsh --print-full-init)
```

#### ZSH Kubectl Completion
Add this to your `.zshrc`:
```bash
autoload -U compinit; compinit
```

#### ZSH Syntax Highlighting
Add this to your `.zshrc`:
```bash
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

#### Default Editor
Set your default editor for `kubectl edit`:
```bash
export KUBE_EDITOR=nvim
```