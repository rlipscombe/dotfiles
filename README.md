These are my "dotfiles". There's my (old) bash profile, my (new) zsh profile,
and a bunch of related things, such as tmux config.

They're managed with `stow`; see https://www.gnu.org/software/stow/

## Prerequisite: stow

    # As appropriate:
    sudo apt install stow
    brew install stow

## Prerequisite: zsh

    sudo apt install zsh curl
    chsh -s /usr/bin/zsh
    touch ~/.zshrc

Either log out and back in or just run `zsh`, then...

## Installation

    git clone https://github.com/rlipscombe/dotfiles

## Activation

    cd path/to/dotfiles
    stow -t $HOME zsh git
