#!/bin/sh
#
# File: ccs.sh
# Author: Ragib Asif
# Email: ragib.asif30@myhunter.cuny.edu
# GitHub: https://github.com/ragibasif
# LinkedIn: https://www.linkedin.com/in/ragibasif/
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Ragib Asif
# Version 1.0.0
#
# Code Commented Separator is a shell script to generate commented separators
# for source code. Currently supports: c, cpp, py, lua, sh, go
#

################################################################################
#                                  DEBUGGING                                   #
################################################################################

# set -Ceuvx
# set -n

################################################################################
#                                     HELP                                     #
################################################################################

help() {
    printf '\t%s\n\n' "Help:"
    printf '\t%s\n\n' "$0 -h, --help, help: Show help menu."
    printf '\t%s\n\n' "Available languages: c, cpp, py, lua, sh, go"
    printf '\t%s\n\n' "$0 [LANGUAGE EXTENSION] [TITLE]"
    printf '\t%s\n\n' "Example: $0 c \"MACROS\""
    printf '\t%s\n%s\n' "Will output:" "
        /*############################################################################*/
        /*                                   MACROS                                   */
        /*############################################################################*/
    "
    exit 1
}

if [ -z "$1" ]; then
    help
fi

case "$1" in
"-h" | "--help" | "help")
    help
    ;;
esac

################################################################################
#                                     MAIN                                     #
################################################################################

LANGUAGE="$1"
TITLE="$2"
COLUMNS="80"
CHAR=""
COMMENT_START=""
COMMENT_END=""
LINE=""

case $LANGUAGE in
"sh")
    COMMENT_START="#"
    COMMENT_END="#"
    CHAR="#"
    ;;

"cpp")
    COMMENT_START="/*"
    COMMENT_END="*/"
    CHAR="*"
    ;;

"c")
    COMMENT_START="/*"
    COMMENT_END="*/"
    CHAR="*"
    ;;

"py")
    COMMENT_START="#"
    COMMENT_END="#"
    CHAR="#"
    ;;

"go")
    COMMENT_START="//"
    COMMENT_END="//"
    CHAR="/"
    ;;

"lua")
    COMMENT_START="--"
    COMMENT_END="--"
    CHAR="-"
    ;;

*)
    # Else
    help
    ;;
esac

TOTAL_COLUMNS=$((COLUMNS - ${#COMMENT_START} - ${#COMMENT_END}))
START=0
END=$TOTAL_COLUMNS

while [ "$START" -lt "$END" ]; do
    START=$((START + 1))
    LINE="${LINE}${CHAR}"
done

OUTPUT_DIR=ccs
mkdir -p "$PWD"/"${OUTPUT_DIR}"
OUTPUT_FILE="output.$LANGUAGE"
OUTPUT_LOCATION="${OUTPUT_DIR}"/"${OUTPUT_FILE}"

{
    printf '%s%s%s\n' "$COMMENT_START" "$LINE" "$COMMENT_END"
    printf '%s%*s%*s\n' "$COMMENT_START" $(((${#TITLE} + TOTAL_COLUMNS) / 2)) "$TITLE" $((TOTAL_COLUMNS - ((${#TITLE} + TOTAL_COLUMNS) / 2) + ${#COMMENT_END})) "$COMMENT_END"
    printf '%s%s%s\n' "$COMMENT_START" "$LINE" "$COMMENT_END"
} >>"$OUTPUT_LOCATION"

printf '%s\n' "Success!"
printf '%s %s\n' "Output location: " "$PWD"/"$OUTPUT_LOCATION"

exit 0
