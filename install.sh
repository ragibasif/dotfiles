#!/bin/bash

# Stow all stowable files to the appropriate locations.
# This approach is preferred over the dot or star command.
#
#
# https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/
# Have the files inside a git repository
# stow --adopt *
# git restore .
# Stow will create a symlink and overwrite the files inside your repository and git will undo the changes and return to the original files but the symlinks will stay there.
#

# set -x
set -vx

stow --adopt bash
stow --adopt nvim
stow --adopt vim
stow --adopt git
stow --adopt tmux
stow --adopt fastfetch
stow --adopt zsh
stow --adopt amethyst

# on MACOS
if [[ $OSTYPE == 'darwin'* ]]; then
  sudo cp -i ~/dotfiles/bin/bin/* /usr/local/bin/
else
  stow --adopt bin
fi

git restore .
