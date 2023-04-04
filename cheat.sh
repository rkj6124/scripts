#!/bin/bash

languages=$(echo "python" "rust" "golang" "java" "javascript" "nodejs" "typescript" | tr ' ' '\n')
coreutils=$(echo "xargs" "sed" "awk" "grep" | tr ' ' '\n')

selected=$(printf "$languages\n$coreutils" | fzf)
read -p "query: " query

if echo $languages | grep -qs $selected; then
	tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
	# echo "language"
else
	# echo "coreudil"
	tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
