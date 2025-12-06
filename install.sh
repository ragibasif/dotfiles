#!/usr/bin/env bash
#
# File: install.sh
# Author: Ragib Asif
# Email: ragibasif@tuta.io
# GitHub: https://github.com/ragibasif
# LinkedIn: https://www.linkedin.com/in/ragibasif/
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Ragib Asif
# Version 1.0.0
#
# Description:
#   - Stow all stowable files to the appropriate locations.
#   - This approach is preferred over the dot or star command.
#
# Notes:
#   - <https://www.reddit.com/r/linux4noobs/comments/b5ig2h/is_there_any_way_to_force_gnu_stow_to_overwrite/>
#   - Have the files inside a git repository
#   - stow --adopt *
#   - git restore .
#   - Stow will create a symlink and overwrite the files inside your repository and git will undo the changes and return to the original files but the symlinks will stay there.
#

set -o verbose   # set -v
set -o xtrace    # set -x
set -o noclobber # set -C
set -o posix
set -o nounset # set -u
set -o errexit # set -e
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace # set -E
set -o pipefail

# set -o noexec # set -n

IFS=$'\n\t'

_main() {

    stow --adopt git

    stow --adopt zsh

    stow --adopt nvim
    stow --adopt vim

    stow --adopt tmux

    stow --adopt ssh

    stow --adopt fastfetch

    stow --adopt bat
    stow --adopt freeze

    # Get OS type (Linux, Darwin/macOS, etc.)
    OS="$(uname -s)"

    # macOS-specific install
    if [ "$OS" = "Darwin" ]; then
        sudo cp -i ~/dotfiles/bin/bin/* /usr/local/bin/
        cp -i ~/dotfiles/Code/.config/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json
        stow --adopt amethyst
    else
        stow --adopt bin
        stow --adopt Code
    fi

    git restore .

}

_main
exit 0
