#!/usr/bin/zsh
a=$1
n=$#
echo $a
git add .
if
    $a=""
then
    git commit -m "new"
else
    git commit -m $a
fi
git push
