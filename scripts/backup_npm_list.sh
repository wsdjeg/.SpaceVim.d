#!/bin/bash
if [ -e npm_list.txt ]
then
    rm npm_list.txt
fi
flag=1
for package in `npm -g ls --depth=0 --parseable`
do
    if [ $flag == 1 ]
    then
        flag=0
    else
        echo "${package##*/}" >> npm_list.txt
    fi
done
