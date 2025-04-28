# .zshrc

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="apple"

zstyle ':omz:update' mode auto      # update automatically without asking

DISABLE_AUTO_TITLE="true"

plugins=(
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases

unalias -a

if [ -f ~/.aliasrc ]; then
    source ~/.aliasrc
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$HOME/bin:$PATH" # this allows me to run the bash scripts i wrote

[ -f "/Users/ragibasif/.ghcup/env" ] && . "/Users/ragibasif/.ghcup/env" # ghcup-env

