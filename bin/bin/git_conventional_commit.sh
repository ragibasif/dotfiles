#!/bin/sh
# File: git_conventional_commit.sh
# Author: Ragib Asif
# Email: 182296466+ragibasif@users.noreply.github.com
# GitHub: https://github.com/ragibasif
# LinkedIn: https://www.linkedin.com/in/ragibasif/
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Ragib Asif
# Version 1.0.0

set -Ceuvx
# set -n

TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
SCOPE=$(gum input --placeholder "scope(optional,leave empty to skip)")
BREAKING_CHANGE=$(gum input --placeholder "breaking change?(optional,leave empty to skip)")

# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"
test -n "$BREAKING_CHANGE" && BREAKING_CHANGE="!"

# Pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE$BREAKING_CHANGE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change")

# Commit these changes if user confirms
gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"

exit 0
