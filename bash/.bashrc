# .______        ___           _______. __    __
# |   _  \      /   \         /       ||  |  |  |
# |  |_)  |    /  ^  \       |   (----`|  |__|  |
# |   _  <    /  /_\  \       \   \    |   __   |
# |  |_)  |  /  _____  \  .----)   |   |  |  |  |
# |______/  /__/     \__\ |_______/    |__|  |__|

#
# ~/.bashrc
#

# PS1='[\u@\h \W]\$ '

# aliases
unalias -a

if [ -f ~/.shellrc ]; then
    source ~/.shellrc
fi

# SHELL options
# append to the history file, don't overwrite it
shopt -s histappend
# If we enter a directory name on its own, assume we want to 'cd' into it.
shopt -s autocd
# Try to correct typos when auto-completing directory names.
shopt -s dirspell

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
