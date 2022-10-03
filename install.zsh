#!/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dir=${0:a:h}

ln -sf $dir/zshrc $HOME/.zshrc
ln -sf $dir/zprofile $HOME/.zprofile

ln -sf $dir/oh-my-zsh/plugins/rlipscombe-git $HOME/.oh-my-zsh/plugins
ln -sf $dir/oh-my-zsh/themes/rlipscombe.zsh-theme $HOME/.oh-my-zsh/themes

ln -sf $dir/tmux.conf $HOME/.tmux.conf
ln -sf $dir/gitconfig $HOME/.gitconfig
