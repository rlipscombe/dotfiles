#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for i in bash_aliases bash_colors bash_functions bash_logout bash_profile bash_prompt bashrc dir_colors direnvrc gitconfig
do
  ln -sf $DIR/$i ~/.$i
done

