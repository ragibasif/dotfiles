#!/bin/sh

set -Ceuvx
# set -n # debugging

git add -A # Add all files and commit them
git commit -m "backup: automated update $(date +%c)"
git push origin master # push master branch to github
