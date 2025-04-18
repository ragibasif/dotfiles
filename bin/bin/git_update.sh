#!/bin/bash

# Backup/update current directory to github
#

# set -x
set -vx

master=master

git add -A  # Add all files and commit them
git commit -m "{{AUTOMATED UPDATE}} $(date +%c)"
git push origin $master # push master branch to github
