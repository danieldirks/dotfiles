autoload -Uz compinit promptinit
compinit
promptinit

setopt autocd

ttyctl -f

# history
HISTFILE=~/.zsh_history
SAVEHIST=1000  # max lines saved in HISTFILE
HISTSIZE=1000  # lenght of loaded hist in memory

# antigen
ZSH_BASE=$HOME/.zsh
source $ZSH_BASE/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jeffreytse/zsh-vi-mode

case `uname` in
  Darwin)
    antigen bundle osx
  ;;
  Linux)
  ;;
esac

antigen apply

# defaults
export EDITOR='nvim'
source $ZSH_BASE/prompt.zsh
source $ZSH_BASE/aliases.zsh
