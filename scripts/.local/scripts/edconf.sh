#!/usr/bin/env bash

ffile=$((cat ~/.listconfigs && find ~/bin/prefix/scripts) | $1)
commmand=$(echo -e "emacs\nemacsclient\nemacsclient -c" | $1)
IFS=', ' read -r -a carr <<< "$commmand"

"${carr[@]}" $ffile&
