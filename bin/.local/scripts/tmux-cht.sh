#!/usr/bin/env bash

selected=$(cat ~/.tmux-cht-languages ~/.tmux-cht-core | fzf)
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Query: " query

if grep -qs $selected ~./tmux-cht-languages; then
    tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
    tmux neww bash -c "curl cht.sh/$selected~$query | less"
fi

