# .______        ___           _______. __    __
# |   _  \      /   \         /       ||  |  |  |
# |  |_)  |    /  ^  \       |   (----`|  |__|  |
# |   _  <    /  /_\  \       \   \    |   __   |
# |  |_)  |  /  _____  \  .----)   |   |  |  |  |
# |______/  /__/     \__\ |_______/    |__|  |__|

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

if [ -f ~/.aliasrc ]; then
    source ~/.aliasrc
fi

# enable vi mode
set -o vi

# get proper color
export TERM="xterm-256color"

# no duplicate entries
export HISTCONTROL=ignoredups:erasedups
export EDITOR=nvim
export VISUAL=nvim

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH="$HOME/bin:$PATH" # this allows me to run the bash scripts i wrote
