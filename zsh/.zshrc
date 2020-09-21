# Path to your oh-my-zsh installation.
export ZSH="/home/alan/.oh-my-zsh"

# Theme
ZSH_THEME="candy"

# Auto Update
export UPDATE_ZSH_DAYS=14

# __Plugins__

plugins=(
    git
    python
    vi-mode
    colorize
    command-not-found
)

source $ZSH/oh-my-zsh.sh

# __Aliases__

# configs
alias virc="nvim ~/dots/nvim/.config/nvim/init.vim"
alias zshr="nvim ~/dots/zsh/.zshrc"
alias i3con="nvim ~/dots/i3/.config/i3/config"
alias rzsh="source ~/.zshrc"

# lazy shit
alias c="clear"
alias pacman="sudo pacman"
alias vim="nvim"

# git
alias gstat="git status"
alias gco="git checkout"
alias gcm="git commit -a"
alias gin="git init"
alias gc="git clone"
alias gp="git push"

# Sources
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions
