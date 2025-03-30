This is my .dotfiles repository. It contains my configuration files and scripts for various applications and tools I use on my system.

## Tools needed

- [Homebrew](https://brew.sh/) - Package manager for macOS and Linux
- [yadm](https://github.com/yadm-dev/yadm) - Yet Another Dotfiles Manager
- [bat](https://github.com/sharkdp/bat) - A cat clone with wings
- [lsd](https://github.com/lsd-rs/lsd) - The next gen ls command
- [neovim](https://github.com/neovim/neovim) - A hyperextensible Vim-based text editor
- [atuin](https://github.com/atuinsh/atuin) - A shell history manager
- [zellij](https://github.com/zellij-org/zellij) - A terminal workspace with batteries included
- [arkade](https://github.com/alexellis/arkade) - The developer's marketplace for Kubernetes
- [ripgrep](https://github.com/BurntSushi/ripgrep) - A line-oriented search tool that recursively searches your current directory for a regex pattern
- [helm](https://github.com/helm/helm) - The Kubernetes package manager
- [kubectl](https://github.com/kubernetes/kubectl) - The Kubernetes command-line tool
- [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder
- [ruby](https://github.com/ruby/ruby) - A dynamic, open source programming language with a focus on simplicity and productivity
- [uv](https://github.com/astral-sh/uv) - A command-line tool for running and managing Python scripts
- [zoxide](https://github.com/ajeetdsouza/zoxide) - A smarter cd command that learns your habits
- [lazygit](https://github.com/jesseduffield/lazygit) - A simple terminal UI for git commands
- [kustomize](https://github.com/kubernetes-sigs/kustomize) - A tool for customizing Kubernetes YAML configurations
- [k9s](https://github.com/derailed/k9s) - A terminal UI for managing Kubernetes clusters
- [jq](https://github.com/jqlang/jq) - A lightweight and flexible command-line JSON processor
- [vault](https://github.com/hashicorp/vault) - A tool for managing secrets and sensitive data
- [go](https://github.com/golang/go) - A programming language designed for building simple, reliable, and efficient software

All that in one easy command:

```bash
brew install "zoxide" "yadm" "zellij" "bat" "lsd" "atuin" "arkade" "ripgrep" "fzf" "helm" "kubectl" "ruby" "neovim" "uv" "lazygit" "kustomize" "k9s" "jq" "vault" "go"
```

Installation of python tools:

Installs

- [posting](https://github.com/darrenburns/posting) - A powerful HTTP client that lives in your terminal.

```bash
uv tool install --python 3.13 posting

```
