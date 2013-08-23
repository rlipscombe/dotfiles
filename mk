#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for i in bash_colors bash_logout bash_profile bash_prompt bashrc
do
  ln -sf $DIR/$i ~/.$i
done

