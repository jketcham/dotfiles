# Path to your oh-my-zsh installation.
export ZSH=/home/jack/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Disable oh-my-zsh theme (starship handles the prompt)
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-extras sudo npm tmux)

source $ZSH/oh-my-zsh.sh

# Starship prompt (replaces oh-my-zsh theme + timestamp)
eval "$(starship init zsh)"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias sc="systemctl"

alias pkr='gpg-connect-agent "scd serialno" "learn --force" /bye'

# set editor
export EDITOR=nvim
alias vim=nvim

# Go stuff
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source /usr/share/nvm/init-nvm.sh

export PATH=$PATH:$HOME/.local/bin

# Shift+Enter inserts a newline instead of executing
# Works with iTerm2 key mapping (Shift+Return → Send Escape Sequence → [13;2u)
# and tmux extended-keys + S-Enter bind in .tmux.conf
function insert-newline() {
  LBUFFER+=$'\n'
}
zle -N insert-newline
bindkey '\e[13;2u' insert-newline

# gpg agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# mise (runtime version manager — replaces nvm)
eval "$(mise activate zsh)"

[[ ! $DISPLAY && $XDG_VTNR -eq 1 && $(id --group) -ne 0 ]] && exec startx
