# ---------- PATH ----------
export PATH="$HOME/.local/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ---------- Prompt ----------
eval "$(starship init zsh)"

# ---------- Atuin (history) ----------
eval "$(atuin init zsh --disable-up-arrow)"

# ---------- Completion ----------
autoload -U compinit; compinit
source <(kubectl completion zsh)
compdef _kubectl k

# ---------- Oh My Zsh ----------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"   # prompt theme is mostly handled by starship; this is harmless
plugins=(git kubectl kubectx dirhistory)
source $ZSH/oh-my-zsh.sh

# ---------- Autosuggest & Highlight ----------
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # keep LAST

# ---------- Aliases ----------
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
alias kap='kubectl apply -f'
alias kdry='kubectl -o yaml --dry-run=client'

# human-friendly pager
command -v bat >/dev/null || alias bat='cat'

# ---------- Editor & Kubeconfigs ----------
export KUBE_EDITOR=nvim
export KUBECONFIG="$HOME/.kube/config"

# ---------- Helpful funcs ----------
# Explain with field paths, piped through pager
ke() { kubectl explain "$@" --recursive | ${PAGER:-less}; }

# Grep resources by label quickly
kgl() { kubectl get "$1" -l "$2" -o wide; }

# Current k8s context/namespace at a glance
kc() { kubectl config view --minify -o jsonpath='{.contexts[0].name}{" "}{.contexts[0].context.namespace}{"\n"}'; }