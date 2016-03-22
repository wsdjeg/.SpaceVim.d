#!/bin/bash
#
# Symlinks the configs

# Init colors
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Manager func
symlink () {
    TARGET=$PWD/$1
    FILE=$HOME/.$1
    if [ -e "$FILE" ]
    then
        if file $FILE | grep $PWD &> /dev/null;then
            printf "Installed $RED$FILE$NC\n"
        else
            printf "Skipping $RED$FILE$NC\n"
        fi
    else
        printf "Linking $CYAN$FILE$NC -> $BLUE$TARGET$NC\n"
        ln -s "$TARGET" "$FILE"
    fi
}

# Create directorys
if [ ! -d "$HOME/.irssi" ];then
    mkdir ~/.irssi
fi

if [ ! -d "$HOME/.weechat" ];then
    mkdir ~/.weechat
fi

if [ ! -d "$HOME/.config" ];then
    mkdir ~/.config
fi

# Install configuration
symlink 'fonts'
symlink 'config/i3/config'
symlink 'i3status.conf'
symlink 'config/fcitx/config'
symlink 'weechat/plugins.conf'
symlink 'weechat/weechat.conf'
symlink 'irssi/config'
symlink 'irssi/default.theme'
symlink 'bashrc'
symlink 'gitconfig'
symlink 'gitignore'
symlink 'gtkrc-2.0'
symlink 'inputrc'
symlink 'vim'
symlink 'zshrc'
symlink 'vimperatorrc'

if cat /etc/issue | grep Ubuntu &> /dev/null;then
    printf "$RED""Warning ""$NC""$BLUE""This is ubuntu,and will skip xinitrc$NC\n"
else
    symlink 'xinitrc'
fi

if [ -e ~/.config/nvim ]
then
    printf "Installed $RED~/.config/nvim$NC\n"
else
    printf "Linking $CYAN~/.config/nvim$NC -> $BLUE$PWD/vim$NC\n"
    ln -s $PWD/vim ~/.config/nvim
fi

# Install bash-git-prompt
if [ -e ~/.bash-git-prompt ]
then
    printf "Installed $RED~/.bash-git-prompt$NC\n"
else
    printf "$CYAN Downloading  bash-git-prompt -> $BLUE$HOME/.bash-git-prompt$NC\n"
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
    printf "$BLUE Finished Downloading$NC\n"
fi


# Install FZF
if [ -e ~/.fzf ]
then
    printf "Installed $RED~/.fzf$NC\n"
else
    printf "$CYAN Downloading  fzf -> $BLUE$HOME/.fzf$NC\n"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    printf "$BLUE Finished Installing fzf$NC\n"
fi
