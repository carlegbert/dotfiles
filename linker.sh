#!/bin/bash
#
# Script for creating symlinks from $HOME/dotfiles to $HOME.
# Already-existing files will be overwritten by links!

shopt -s dotglob

mklinks() {
  for f in $1/*; do
    fileloc=$(echo $f | sed 's/dotfiles\///g')
    if [ -d $f ] && [ $f != "$HOME/dotfiles/.git" ] && [ "$(ls -A $f)" ]; then
      if ! [ -e $fileloc ]; then
        echo "Creating directory $fileloc"
        mkdir $fileloc
      fi
      mklinks $f
    elif ! [ -d $f ] && [ $f != "$HOME/dotfiles/linker.sh" ]; then
      echo "$f links to $fileloc"
      ln -sf $f $fileloc
    fi
  done
}

mklinks "$HOME/dotfiles"
