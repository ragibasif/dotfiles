#!/bin/bash

note="$HOME/repos/notes/inbox/$(date +%Y-%m-%d).md"

if [ ! -f $note ]; then
  echo "# $(date +%A\,\ %B\,\ %d\,\ %Y)" > $note
  echo "#inbox" >> $note
fi

nvim -c "norm Go" \
  -c "norm Go## $(date +%r)" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $note

