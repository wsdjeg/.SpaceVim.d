#!/usr/bin/zsh
a=$1
num=$#
echo $a
git add .
if 
    $num=0
then
    git commit -m "new"
else
    git commit -m $a
fi
git push
