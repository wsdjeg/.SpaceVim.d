#!/bin/bash
img=$(date '+/tmp/%N.png')
scrot -z "$@" $img >/dev/null 2>&1
res=$(curl -s -F c=@$img https://img.vim-cn.com/)
echo $res | xclip  -selection clipboard
