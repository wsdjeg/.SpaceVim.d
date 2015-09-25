#!/usr/bin/zsh
Main(){
    git add .
    git commit -m $1
    git push
}

if [ $# -eq 1];then
    Main
fi
