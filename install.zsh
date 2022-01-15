#!/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dir=${0:a:h}

ln -sf $dir/zshrc $HOME/.zshrc

rm -r $HOME/.oh-my-zsh/custom
ln -sf $dir/oh-my-zsh/custom $HOME/.oh-my-zsh/custom
