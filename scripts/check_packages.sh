#!/bin/bash
if [ $# -eq 1 ]
then
    for package in `cat package_list.txt | grep $1`
    do
        pacman -Ss ${package}
    done
fi
