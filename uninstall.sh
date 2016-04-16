#!/bin/bash
#
# Init colors
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ $# -eq 1 ]
then
    case $1 in
        nvim)
            if [ -e ~/.config/nvim ]
            then
                rm -rf ~/.config/nvim
                printf "Uninstalling ${RED}nvim$NC\n"
            else
                printf "Uninstalled ${CYAN}nvim$NC\n"
            fi
            exit 0
            ;;
        vim)
            if [ -e ~/.vimrc ]
            then
                mv ~/.vimrc ~/.vimrc_back
                printf "Move $RED~/.vimrc to ~/.vimrc_back$NC\n"
            fi
            if [ -e ~/.vim ]
            then
                rm -rf ~/.vim
                printf "Uninstalling $RED~/.vim$NC\n"
            else
                printf "Uninstalled $CYAN~/.vim$NC\n"
            fi
            exit 0
            ;;
    esac
fi
