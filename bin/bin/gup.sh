#!/bin/sh
#
# File: gup.sh
# Author: Ragib Asif
# Email: ragib.asif30@myhunter.cuny.edu
# GitHub: https://github.com/ragibasif
# LinkedIn: https://www.linkedin.com/in/ragibasif/
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Ragib Asif
# Version 1.0.0
#
# This script will add all files in the directory, commit them with a message
# and timestamp, and pushes them to master.
#

set -Ceuvx
# set -n

MAGENTA='\033[95m'
BOLD='\033[1m'
RESET='\033[0m' # No Color
FILE="${BOLD}${MAGENTA}$(eval basename "$0")${RESET}"
echo "${FILE}"

git add -A # Add all files and commit them
git commit -m "backup: automated update $(date +%c)"
git push origin master # push master branch to github

exit 0
