#!/bin/bash
for file in *.pdf *.epub; do
    mv "$file" "${file/_Z_Library_/}"
done
