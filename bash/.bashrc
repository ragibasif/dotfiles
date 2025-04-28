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

source "./.aliases"

# alias v='nvim'
# alias ls='lsd'
# alias cat='bat'
# alias grep='grep --color=auto'
# alias dl-song='yt-dlp -P "~/Music" -x --audio-format mp3 --audio-quality 0 -o "%(uploader)s_%(playlist)s/%(title)s.%(ext)s" --embed-metadata --parse-metadata "%(title)s:%(meta_title)s" --parse-metadata "%(uploader)s:%(meta_artist)s" --parse-metadata "%(playlist)s:%(meta_album)s" --parse-metadata "%(playlist_index)s:%(meta_track)s" -i'
# PS1='[\u@\h \W]\$ '
#
# alias val='valgrind --tool=memcheck --leak-check=full --show-reachable=yes --error-exitcode=1'
#
# alias mv='mv -iv'
# ## undo mv:
# function unmv { mv -iv "$2" "$1" }
#

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

# display sytem logo and info upon startup of bash terminal
fastfetch

export PATH="$HOME/bin:$PATH" # this allows me to run the bash scripts i wrote
