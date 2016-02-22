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

symlink 'fonts'
symlink 'weechat/plugins.conf'
symlink 'weechat/weechat.conf'
symlink 'irssi/config'
symlink 'bashrc'
symlink 'gitconfig'
symlink 'gtkrc-2.0'
symlink 'inputrc'
symlink 'vim'
symlink 'zshrc'

if [ -e ~/.config/nvim ]
then
  printf "Skipping $RED~/.config/nvim$NC\n"
else
  printf "Linking $CYAN~/.config/nvim$NC -> $BLUE$PWD/vim$NC\n"
  ln -s $PWD/vim ~/.config/nvim
fi

if [ -e ~/.bash-git-prompt ]
then
    printf "Skipping $RED~/.bash-git-prompt$NC\n"
else
    printf "$CYAN Downloading  bash-git-prompt -> $BLUE$HOME/.bash-git-prompt$NC\n"
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
    printf "$BLUE Finished Downloading$NC\n"
fi


if [ -e ~/.fzf ]
then
    printf "Skipping $RED~/.fzf$NC\n"
else
    printf "$CYAN Downloading  fzf -> $BLUE$HOME/.fzf$NC\n"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    printf "$BLUE Finished Installing fzf$NC\n"
fi
