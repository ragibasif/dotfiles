#!/bin/bash
set -vx

git add -A # Add all files and commit them
git commit -m "backup: automated update $(date +%c)"
git push origin master # push master branch to github
