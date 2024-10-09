#!/bin/bash

# clear history of remote git repo
#

master=master

git checkout --orphan newBranch
git add -A  # Add all files and commit them
git commit -m "clear git history"
git branch -D $master  # Deletes the master branch
git branch -m $master  # Rename the current branch to master
git push -f --set-upstream origin $master # Force push master branch to github
git gc --aggressive --prune=all # remove the old files
