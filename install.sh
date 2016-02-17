#!/bin/sh
#
# Symlinks the configs

CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

symlink () {
  TARGET=$PWD/$1
  FILE=~/.$1
  if [ -e "$FILE" ]
  then
    printf "Skipping $RED$FILE$NC\n"
  else
    printf "Linking $CYAN$FILE$NC -> $BLUE$TARGET$NC\n"
    ln -s "$TARGET" "$FILE"
  fi
}

symlink 'gtkrc-2.0'
symlink 'vimrc'
symlink 'bashrc'
symlink 'inputrc'
symlink 'fonts'
symlink 'zshrc'
