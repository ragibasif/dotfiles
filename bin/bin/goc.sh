#!/bin/sh
#
# File: goc.sh
# Author: Ragib Asif
# Email: ragib.asif30@myhunter.cuny.edu
# GitHub: https://github.com/ragibasif
# LinkedIn: https://www.linkedin.com/in/ragibasif/
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Ragib Asif
# Version 1.0.0
#
# This script will obliterate all commit history in local and remote repo. Use
# at your own risk.
#
# https://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository

set -Ceuvx
# set -n # debugging

MAGENTA='\033[95m'
BOLD='\033[1m'
RESET='\033[0m' # No Color
FILE="${BOLD}${MAGENTA}$(eval basename "$0")${RESET}"
echo "${FILE}"

git checkout --orphan newBranch
git add -A # Add all files and commit them
git commit -m "obliterate git commit history"
git branch -D master                     # Deletes the master branch
git branch -m master                     # Rename the current branch to master
git push -f --set-upstream origin master # Force push master branch to github
git gc --aggressive --prune=all          # remove the old files
