# check if ~/.SpaceVim exist

if [ ! -d "$HOME/SpaceVim" ];then
    mkdir ~/SpaceVim
fi

# clone SpaceVim to ~/SpaceVim/SpaceVim
if [ ! -d "$HOME/SpaceVim/SpaceVim" ];then
    git clone git@github.com:wsdjeg/SpaceVim.git ~/SpaceVim/SpaceVim
    # change to spacevim dir
    cd ~/SpaceVim/SpaceVim
    # Add upstream remote
    git remote add upstream https://github.com/SpaceVim/SpaceVim.git
fi

# lang#markdown layer
if [ ! -d "$HOME/SpaceVim/vim-markdown" ];then
    git clone git@github.com:SpaceVim/vim-markdown.git ~/SpaceVim/vim-markdown
fi

# lang#elm layer
if [ ! -d "$HOME/SpaceVim/vim-elm" ];then
    git clone git@github.com:wsdjeg/vim-elm.git ~/SpaceVim/vim-elm
fi
