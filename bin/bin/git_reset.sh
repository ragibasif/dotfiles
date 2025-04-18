#!/bin/bash

# set -x
set -vx

# clear history of remote git repo
# https://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository


master=master

git checkout --orphan newBranch
git add -A  # Add all files and commit them
git commit -m "reset"
git branch -D $master  # Deletes the master branch
git branch -m $master  # Rename the current branch to master
git push -f --set-upstream origin $master # Force push master branch to github
git gc --aggressive --prune=all # remove the old files
