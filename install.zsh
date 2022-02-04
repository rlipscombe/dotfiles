#!/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dir=${0:a:h}

ln -sf $dir/zshrc $HOME/.zshrc

echo "TODO: Fix up symlinks in 'custom'"
