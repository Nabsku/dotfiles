# [Znap Plugin Manager]
[[ -r ~/.config/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/znap
source ~/.config/znap/znap.zsh

# [Oh My Zsh]
DISABLE_LS_COLORS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME="robbyrussell"
plugins=(git)

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

# [Aliases]
source $ZSH_CUSTOM/kubectl.zsh
source $ZSH_CUSTOM/ls.zsh
source $ZSH_CUSTOM/zellij.zsh
source $ZSH_CUSTOM/nvim.zsh

# [Evals]
eval "$(atuin init --disable-up-arrow zsh)"
eval "$(zellij setup --generate-auto-start zsh)"
eval "$(brew shellenv)"

# [fpath] trickery
export fpath=(
    $fpath
    $ZSH_CUSTOM/completion
    $(brew --prefix)/share/zsh-completions
)

# [Completion]
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
zstyle :compinstall filename '/Users/yannick/.zshrc'
autoload -Uz compinit && compinit -C
source ~/.oh-my-zsh/custom/completion/kubectl.zsh

# [Exports]
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
