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
