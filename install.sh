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
if [ ! -d "$HOME/.irssi/scripts/autorun" ];then
    mkdir -p ~/.irssi/scripts/autorun
fi

if [ ! -d "$HOME/.weechat" ];then
    mkdir ~/.weechat
fi

if [ ! -d "$HOME/.config" ];then
    mkdir ~/.config
fi

if [ ! -d "$HOME/.config/termite" ];then
    mkdir ~/.config/termite
fi

if [ ! -d "$HOME/.config/i3status" ];then
    mkdir ~/.config/i3status
fi

# Install configuration
symlink 'fonts'
# mail
symlink 'mutt'
symlink 'getmail'
symlink 'muttrc'
symlink 'msmtprc'
symlink 'procmailrc'
symlink 'mailcap'
# windows manager
symlink 'config/i3/config'
symlink 'config/i3status/config'
symlink 'config/vifm'
symlink 'config/nvim'
symlink 'config/fcitx/config'
symlink 'config/termite/config'
symlink 'weechat/plugins.conf'
symlink 'weechat/weechat.conf'
symlink 'irssi/config'
symlink 'irssi/default.theme'
symlink 'bashrc'
symlink 'gitconfig'
symlink 'gitignore'
symlink 'gtkrc-2.0'
symlink 'inputrc'
symlink 'zshrc'
symlink 'vimperatorrc'

if cat /etc/issue | grep Ubuntu &> /dev/null;then
    printf "$RED""Warning ""$NC""$BLUE""This is ubuntu,and will skip xinitrc$NC\n"
else
    symlink 'xinitrc'
    symlink 'xprofile'
fi

if [ -e ~/.vim ]
then
    printf "Installed $RED~/.vim$NC\n"
else
    printf "Linking $CYAN~/.vim$NC -> $BLUE$PWD/config/nvim$NC\n"
    ln -s $PWD/config/nvim ~/.vim
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

# Install irssi script
irssi_add () {
    SCRIPT=$HOME/.irssi/scripts/$1.pl
    SCRIPTAUTO=$HOME/.irssi/scripts/autorun/$1.pl
    SCRIPTUP=https://raw.githubusercontent.com/irssi/scripts.irssi.org/gh-pages/scripts/$1.pl
    if [ -e "$SCRIPT" ]
    then
        printf "Installed $RED$SCRIPT$NC\n"
    else
        printf "$CYAN Downloading  $1.pl -> $BLUE$SCRIPT$NC\n"
        curl -fLo $SCRIPT --create-dirs $SCRIPTUP
        printf "$BLUE Finished Downloading$NC\n"
    fi
    if [ $# == 2 ]
    then
        if [ $2 -eq 1 ]
        then
            if [ -e "$SCRIPTAUTO" ]
            then
                printf "Installed $RED$SCRIPTAUTO$NC\n"
            else
                ln -s "$SCRIPT" "$SCRIPTAUTO"
                printf "Linking $CYAN$SCRIPTAUTO$NC -> $BLUE$SCRIPT$NC\n"
            fi
        fi
    fi
}
irssi_add 'adv_windowlist' '1'
irssi_add 'go' '1'
irssi_add 'queryresume' '1'
irssi_add 'trackbar' '1'
irssi_add 'nickcolor' '1'
