#!/usr/bin/zsh
git add .
if $#=0
then
    git commit -m "new"
else
    git commit -m $0
    echo $0
fi

git push
