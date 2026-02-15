#!/usr/bin/env bash


# <https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/>
# Have the files inside a git repository
# stow --adopt *
# git restore .
# Stow will create a symlink and overwrite the files inside your repository and git will undo the changes and return to the original files but the symlinks will stay there.

set -x

IFS=$'\n\t'

stow --adopt git

stow --adopt zsh

stow --adopt vim
stow --adopt nvim

stow --adopt tmux

stow --adopt ssh

stow --adopt fastfetch

# Get OS type (Linux, Darwin/macOS, etc.)
OS="$(uname -s)"

# macOS-specific install
if [ "$OS" = "Darwin" ]; then
    sudo cp -i ~/dotfiles/bin/bin/* /usr/local/bin/
else
    stow --adopt bin
fi

git restore .

