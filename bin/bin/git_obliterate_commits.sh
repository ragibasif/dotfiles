#!/usr/bin/env bash

# This script will obliterate all commit history in local and remote repo. Use
# at your own risk.
#
# https://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository

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

git checkout --orphan newBranch
git add -A # Add all files and commit them
git commit -m "Initial commit"
git branch -D master                     # Deletes the master branch
git branch -m master                     # Rename the current branch to master
git push -f --set-upstream origin master # Force push master branch to github
git gc --aggressive --prune=all          # remove the old files
