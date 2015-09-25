#!/usr/bin/zsh
a=$1
git add .
if a=""
then
    git commit -m "new"
else
    git commit -m a
    echo a
fi

git push
