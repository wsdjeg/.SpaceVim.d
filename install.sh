#!/bin/bash
# Init colors
# Reset
Color_off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

# utils
need_cmd () {
    if ! command -v "$1" > /dev/null 2>&1
    then printf "${Red}need '$1' (command not found)${Color_off}\n"
    fi
}

# Symlinks the configs
# Manager func
symlink () {
    TARGET=$PWD/$1
    FILE=$HOME/.$1
    if [ -e "$FILE" ]
    then
        if file $FILE | grep $PWD &> /dev/null;then
            printf "Installed $Red$FILE${Color_off}\n"
        else
            printf "Skipping $Red$FILE${Color_off}\n"
        fi
    else
        printf "Linking $Cyan$FILE${Color_off} -> $Blue$TARGET${Color_off}\n"
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

if [ ! -d "$HOME/.ssh" ];then
    mkdir ~/.ssh
fi

if [ ! -d "$HOME/.local/bin" ];then
    mkdir -p ~/.config/bin
fi

if [ ! -d "$HOME/.config/termite" ];then
    mkdir ~/.config/termite
fi

if [ ! -d "$HOME/.config/i3status" ];then
    mkdir ~/.config/i3status
fi

if [ $# -eq 1 ]
then
    case $1 in
        rust)
            if [ ! -e `which rustc` ]
            then
                printf "curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly\n"
                curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly
            fi
            exit 0;
    esac
fi
# Install configuration
symlink 'local/share/fonts'

# mail
symlink 'getmail'
symlink 'muttrc'
symlink 'mutt'
if [ ! -f ~/.msmtprc ];
then
    cp msmtprc ~/.msmtprc
    printf "Copy ${Red}msmtprc to ~/.msmtprc ${Color_off}\n"
    printf "You need to run chmod 0600 ~/.msmtprc after edit password"
    
fi
symlink 'procmailrc'
symlink 'mailcap'


# windows manager
symlink 'config/i3/config'
symlink 'config/i3status/config'
symlink 'config/vifm'
symlink 'config/lilyterm'
# fcitx
symlink 'config/fcitx/config'
symlink 'config/fcitx/conf'
symlink 'config/fcitx/data'
symlink 'config/fcitx/skin'
symlink 'config/fcitx/pinyin/pySym.mb'
# termite
symlink 'config/termite/config'
# npm
symlink 'npmrc'
# weechat
symlink 'weechat/plugins.conf'
symlink 'weechat/weechat.conf'
symlink 'irssi/config'
symlink 'irssi/default.theme'
symlink 'profile'
symlink 'bashrc'
symlink 'bash_logout'
symlink 'bash_profile'
symlink 'gitconfig'
symlink 'gitignore'
symlink 'gtkrc-2.0'
symlink 'inputrc'
symlink 'zshrc'
symlink 'vimperatorrc'
symlink 'backgrounds'
symlink 'scripts'

# custom bin
symlink 'local/bin/vimlint'

# for ctags
symlink 'ctags'

# for SpaceVim
symlink 'SpaceVim.d'

# for qutebrowser
if [ ! -d "$HOME/.config/qutebrowser" ];then
    mkdir ~/.config/qutebrowser
fi
if [ ! -d "$HOME/.local/share/qutebrowser/userscripts" ];then
    mkdir $HOME/.local/share/qutebrowser/userscripts
fi
symlink 'config/qutebrowser/config.py'
symlink 'local/share/qutebrowser/userscripts/ydcv'

# gem
symlink 'gemrc'

# wego
symlink 'wegorc'

# tmux
symlink 'tmux.conf'

if cat /etc/issue | grep Ubuntu &> /dev/null;then
    printf "$Red""Warning ""$Color_off""$Blue""This is ubuntu,and will skip xinitrc$Color_off\n"
else
    symlink 'xinitrc'
    symlink 'xprofile'
fi

# ssh

symlink 'ssh/config'


# Install bash-git-prompt
if [ -e ~/.bash-git-prompt ]
then
    printf "Installed $Red~/.bash-git-prompt$Color_off\n"
else
    printf "$Cyan Downloading  bash-git-prompt -> $Blue$HOME/.bash-git-prompt$Color_off\n"
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
    printf "$Blue Finished Downloading$Color_off\n"
fi

# Install bumblebee-status
if [ -e ~/.bumblebee-status ]
then
    printf "Installed $Red~/.bumblebee-status$Color_off\n"
else
    printf "$Cyan Downloading  bumblebee-status -> $Blue$HOME/.bumblebee-status$Color_off\n"
    git clone https://github.com/wsdjeg/bumblebee-status.git ~/.bumblebee-status
    printf "$Blue Finished Downloading$Color_off\n"
fi

# Install FZF
if [ -e ~/.fzf ]
then
    printf "Installed $Red~/.fzf$Color_off\n"
else
    printf "$Cyan Downloading  fzf -> $Blue$HOME/.fzf$Color_off\n"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    printf "$Blue Finished Installing fzf$Color_off\n"
fi

# Install maven bash complete
if [ -e ~/.maven_bash_completion.bash ]
then
    printf "Installed $Red~/.maven_bash_completion.bash$Color_off\n"
else
    printf "$Cyan Downloading maven_bash_completion.bash -> $Blue$HOME/.maven_bash_completion.bash$Color_off\n"
    curl -fLo ~/.maven_bash_completion.bash https://raw.githubusercontent.com/juven/maven-bash-completion/master/bash_completion.bash
    printf "$Blue Finished Installing maven_bash_completion$Color_off\n"
fi

# Install irssi script
irssi_add () {
    SCRIPT=$HOME/.irssi/scripts/$1.pl
    SCRIPTAUTO=$HOME/.irssi/scripts/autorun/$1.pl
    SCRIPTUP=https://raw.githubusercontent.com/irssi/scripts.irssi.org/master/scripts/$1.pl
    if [ -e "$SCRIPT" ]
    then
        printf "Installed $Red$SCRIPT$Color_off\n"
    else
        printf "$Cyan Downloading  $1.pl -> $Blue$SCRIPT$Color_off\n"
        curl -fLo $SCRIPT --create-dirs $SCRIPTUP
        printf "$Blue Finished Downloading$Color_off\n"
    fi
    if [ $# == 2 ]
    then
        if [ $2 -eq 1 ]
        then
            if [ -e "$SCRIPTAUTO" ]
            then
                printf "Installed $Red$SCRIPTAUTO$Color_off\n"
            else
                ln -s "$SCRIPT" "$SCRIPTAUTO"
                printf "Linking $Cyan$SCRIPTAUTO$Color_off -> $Blue$SCRIPT$Color_off\n"
            fi
        fi
    fi
}
irssi_add 'adv_windowlist' '1'
irssi_add 'go' '1'
irssi_add 'queryresume' '1'
irssi_add 'trackbar' '1'
irssi_add 'nickcolor' '1'


# setup spacevim dev

bash scripts/setup_spacevim_dev.sh
