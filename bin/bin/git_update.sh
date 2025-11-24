#!/usr/bin/env bash
#
# File: git_update.sh
# Author: Ragib Asif
# Email: ragib.asif30@myhunter.cuny.edu
# GitHub: https://github.com/ragibasif
# LinkedIn: https://www.linkedin.com/in/ragibasif/
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Ragib Asif
# Version 1.0.0
#
# Script to stage, commit, and push changes
#

set -o noclobber
set -o nounset
set -o errexit # Exit on error
set -o errtrace
set -o pipefail

set -vx

# set -o noexec # set -n

IFS=$'\n\t'

_THIS="$(basename "${0}")"
_VERSION="1.0.0"

_TITLE="chore: synchronize data and content"
_DESCRIPTION="$(date +%c) Refreshed project data, content files, and related assets with the latest information. Ensured all synchronized resources are current and reflect recent changes from upstream sources."

_main() {
    echo "Running script ${_THIS}, version ${_VERSION}"
    gitleaks git
    git add -A # Add all files and commit them
    git commit -m "${_TITLE}" -m "${_DESCRIPTION}"
    git push # push branch to github
}

_main
