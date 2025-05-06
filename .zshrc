# [Znap Plugin Manager]
{
    [[ -r ~/.config/znap/znap.zsh ]] ||
        git clone --branch main --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.config/znap
    source ~/.config/znap/znap.zsh

    znap install JannoTjarks/catppuccin-zsh
    znap source zsh-users/zsh-autosuggestions
    znap source zsh-users/zsh-syntax-highlighting
}
# [Theme magic]
{
    if [[ ! -d ~/.oh-my-zsh/themes/catppuccin-flavors ]]; then
        mkdir -p ~/.oh-my-zsh/themes/catppuccin-flavors
    fi

    ln -sf ~/.config/JannoTjarks/catppuccin-zsh/catppuccin.zsh-theme ~/.oh-my-zsh/themes/
    ln -sf ~/.config/JannoTjarks/catppuccin-zsh/catppuccin-flavors/* ~/.oh-my-zsh/themes/catppuccin-flavors/
}

# [Oh My Zsh]
DISABLE_LS_COLORS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="mocha"
CATPPUCCIN_SHOW_TIME=true
plugins=(
    git
)

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto

+export GITHUB_TOKEN=$(gh auth token)
source $ZSH/oh-my-zsh.sh

# [Aliases]
{
    source ~/.config/zsh/aliases/kubectl.zsh
    source ~/.config/zsh/aliases/ls.zsh
    source ~/.config/zsh/aliases/zellij.zsh
    source ~/.config/zsh/aliases/nvim.zsh
    source ~/.config/zsh/aliases/cat.zsh
}

# [Evals]
{
    eval "$(atuin init --disable-up-arrow zsh)"
    eval "$(zellij setup --generate-auto-start zsh)"
    eval "$(brew shellenv)"
    eval "$(omnictl completion zsh)"
}
# [fpath] trickery
export fpath=(
    $fpath
    ~/.config/zsh/completion
    $(brew --prefix)/share/zsh-completions
)

# [Completion]
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit

# [Sources]
source ~/.config/zsh/completion/kubectl.zsh
source ~/.config/zsh/completion/dagger.zsh
source ~/.config/zsh/completion/talosctl.zsh
source <(konf-go shellwrapper zsh)

# [Exports]
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:/opt/homebrew/opt/ruby/bin:$PATH"
export EDITOR="nvim"
