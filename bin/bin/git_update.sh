#!/usr/bin/env bash
#
# File: git_update.sh
# Author: Ragib Asif
# Email: ragibasif@tuta.io
# GitHub: https://github.com/ragibasif
# LinkedIn: https://www.linkedin.com/in/ragibasif/
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Ragib Asif
# Version 1.0.0
#
# Script to stage, commit, and push changes
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

_THIS="$(basename "${0}")"
_VERSION="1.0.0"

_TITLE="chore: synchronize data and content"
_DESCRIPTION="$(date +%c) Refreshed project data, content files, and related assets with the latest information. Ensured all synchronized resources are current and reflect recent changes from upstream sources."

_default() {
    echo "Running script ${_THIS}, version ${_VERSION}"
    gitleaks git
    git add -A # Add all files and commit them
    git commit -m "${_TITLE}" -m "${_DESCRIPTION}"
    git push # push branch to github
    exit 0
}

TYPE=$(gum choose "default" "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")

if [[ "$TYPE" == "default" ]]; then
    _default
fi

SCOPE=$(gum input --placeholder "scope(optional,leave empty to skip)")
BREAKING_CHANGE=$(gum input --placeholder "breaking change?(optional,leave empty to skip)")

# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"
test -n "$BREAKING_CHANGE" && BREAKING_CHANGE="!"

# Pre-populate the input with the type(scope): so that the user may change it
_TITLE=$(gum input --value "$TYPE$SCOPE$BREAKING_CHANGE: " --placeholder "Title of this change")
_DESCRIPTION=$(gum write --placeholder "Details of this change")

# Commit these changes if user confirms
gum confirm "Commit changes?" && git commit -m "$_TITLE" -m "$_DESCRIPTION"

exit 0
