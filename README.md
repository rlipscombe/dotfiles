These are my "dotfiles". There's my (old) bash profile, my (new) zsh profile,
and a bunch of related things, such as tmux config.

## Install zsh

    sudo apt install zsh curl
    chsh -s /usr/bin/zsh
    touch ~/.zshrc
    
Either log out and back in or just run `zsh`, then...

## Installation

    git clone https://github.com/rlipscombe/dotfiles
    dotfiles/install.zsh

The above will install Oh-My-Zsh and sort out some symlinks. You'll have to restart zsh to load everything properly.
