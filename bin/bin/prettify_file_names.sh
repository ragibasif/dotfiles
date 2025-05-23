#!/bin/sh

set -Ceuvx
# set -n # debugging

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
                    # echo "Renamed: $file -> $new_file"
                fi
            fi
        done
    else
        echo "Directory does not exist: $search_dir"
        exit 1
    fi

}


chars=(" " "-" "(" ")" "[" "]" "{" "}" "," ";" ":" "$" "%" "&" "*" "^" "#" "@" "!" "'" "\`" "\"" "~" "|" "+" "=" "<" ">" "＂")

for char in "${chars[@]}"; do
    prettify "$char"
done


for f in *.*; do pre="${f%.*}"; suf="${f##*.}"; \
                 mv -- "$f" "${pre//./_}.${suf}"; done

for file in *; do
    new_name=$(echo "$file" | sed 's/_*_/_/g')
    if [ "$file" != "$new_name" ]; then
        mv "$file" "$new_name"
    fi
done
