
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

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# __Aliases__

# reboot to bios
alias rebootbios="systemctl reboot --firmware-setup"

# configs
alias virc="nvim ~/.dots/nvim/.config/nvim/init.vim"
alias zshr="nvim ~/.dots/zsh/.zshrc"
alias i3con="nvim ~/.dots/i3/.config/i3/config"
alias rzsh="source ~/.zshrc"

# lazy shit
alias c="clear"
alias pacman="sudo pacman"
alias vim="nvim"

# I can't spell
alias suod="sudo"


# git
alias gstat="git status"
alias gco="git checkout"
alias gcm="git commit -a"
alias gin="git init"
alias gc="git clone"
alias gp="git push"

# antlr
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

# Exports
export GOPATH=$HOME/go
export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
