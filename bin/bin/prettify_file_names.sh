#!/bin/bash

# Define the directory to search
# in this case this one will be the current working directory
search_dir="./"

prettify() {
    if [[ -d "$search_dir" ]]; then
        for file in "$search_dir"/*; do

            # Extract the file name and extension
            # replace char with underscore
            if [[ "$file" == *"$1"* ]]; then
                new_file="${file//$1/_}"

                if [[ "$file" != "$new_file" ]]; then
                    # rename file name to prettified file
                    mv "$file" "$new_file"
                    echo "Renamed: $file -> $new_file"
                fi
            fi
        done
    else
        echo "Directory does not exist: $search_dir"
        exit 1
    fi

}

prettify " "
prettify "-"
prettify "("
prettify ")"
prettify "["
prettify "]"
prettify "{"
prettify "}"
prettify ","
prettify ";"
prettify ":"
prettify "$"
prettify "%"
prettify "&"
prettify "*"
prettify "^"
prettify "#"
prettify "@"
prettify "!"
prettify "'"
prettify "\`"
prettify "~"
prettify "|"
prettify "+"
prettify "="
prettify "<"
prettify ">"

for f in *.*; do pre="${f%.*}"; suf="${f##*.}"; \
                 mv -i -- "$f" "${pre//./_}.${suf}"; done
