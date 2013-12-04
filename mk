#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for i in bash_aliases bash_colors bash_logout bash_profile bash_prompt bashrc dir_colors
do
  ln -sf $DIR/$i ~/.$i
done

