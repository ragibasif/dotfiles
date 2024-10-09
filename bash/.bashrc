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

alias v='nvim'
alias ls='lsd'
alias cat='bat'
alias grep='grep --color=auto'
alias yt-dlp-audio='yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3'
alias cd='z'
PS1='[\u@\h \W]\$ '

# enable vi mode
set -o vi

# get proper color
export TERM="xterm-256color"
# no duplicate entries
export HISTCONTROL=ignoredups:erasedups
export EDITOR=nvim
export VISUAL=nvim

# make anki work on wayland
export QT_QPA_PLATFORM=wayland
export ANKI_WAYLAND=1

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# display sytem logo and info upon startup of bash terminal
fastfetch
eval "$(zoxide init bash)"

export PATH="$HOME/bin:$PATH" # this allows me to run the bash scripts i wrote

[ -f "/$HOME/.ghcup/env" ] && . "/$HOME/.ghcup/env" # ghcup-env
