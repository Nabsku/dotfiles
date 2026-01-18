# [Znap Plugin Manager]
{
    [[ -r ~/.config/znap/znap.zsh ]] ||
        git clone --branch main --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.config/znap
    source ~/.config/znap/znap.zsh
}

# [Homebrew]
[[ -f /opt/homebrew/bin/brew ]] && path+=('/opt/homebrew/bin')
znap eval brew-shellenv 'brew shellenv'

# [Exports]
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:/opt/homebrew/opt/ruby/bin:$PATH"
export EDITOR="nvim"

# [Theme magic]
if [[ ! -L ~/.oh-my-zsh/themes/catppuccin.zsh-theme ]]; then
    mkdir -p ~/.oh-my-zsh/themes/catppuccin-flavors
    znap install JannoTjarks/catppuccin-zsh
    ln -sf ~/.config/JannoTjarks/catppuccin-zsh/catppuccin.zsh-theme ~/.oh-my-zsh/themes/
    ln -sf ~/.config/JannoTjarks/catppuccin-zsh/catppuccin-flavors/* ~/.oh-my-zsh/themes/catppuccin-flavors/
fi

# [fpath]
export fpath=(
    $fpath
    ~/.config/zsh/completion
    ${HOMEBREW_PREFIX}/share/zsh-completions
)

# [Completion Configuration]
# Case insensitive matching (try exact, then case-insensitive)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Group matches and describe
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
zstyle :compinstall filename '~/.zshrc'

# [UX Options]
setopt AUTO_CD              # Type directory name to cd into it
setopt AUTO_PUSHD           # cd pushes the old directory onto the stack
setopt PUSHD_IGNORE_DUPS    # Don't store duplicates in the stack
setopt PUSHD_SILENT         # Don't print the directory stack after cd
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell

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

# export GITHUB_TOKEN=$(gh auth token)

source $ZSH/oh-my-zsh.sh

# [Plugins]
znap source zsh-users/zsh-autosuggestions

# [Aliases]
{
    source ~/.config/zsh/aliases/kubectl.zsh
    source ~/.config/zsh/aliases/ls.zsh
    source ~/.config/zsh/aliases/zellij.zsh
    source ~/.config/zsh/aliases/nvim.zsh
    source ~/.config/zsh/aliases/cat.zsh
}

# [Sources]
znap eval konf-go "konf-go shellwrapper zsh"

# [Evals]
{
    znap eval atuin "atuin init --disable-up-arrow zsh"
    znap eval zellij "zellij setup --generate-auto-start zsh"
    znap eval omnictl "omnictl completion zsh"
    znap eval zoxide "zoxide init zsh"
}

# [Syntax Highlighting]
znap source zsh-users/zsh-syntax-highlighting
