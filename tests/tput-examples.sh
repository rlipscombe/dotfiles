#!/bin/sh

for bold in 0 1
do
  if [ $bold -eq 0 ]; then
    echo "dim"
    tput dim
  else
    echo "bold"
    tput bold
  fi

  for bg in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
  do
    tput setab $bg
    echo -n "setb $bg"

    for fg in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
    do
      tput setaf $fg
      echo -n " setf $fg "
    done

    echo
  done
done
