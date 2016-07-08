#!/bin/bash
pacman -Q | awk '{print $1}' > package_list.txt
