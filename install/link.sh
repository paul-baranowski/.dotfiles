#!/usr/bin/env bash

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Linking symlink files.$(tput sgr 0)"
echo "---------------------------------------------------------"

linkables=$( find -H "$INSTALLDIR" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
  target="$HOME/.$( basename $file '.symlink' )"
  ln -sf $file $target
  # if [ -e $target ]; then
  #   echo "---------------------------------------------------------"
  #   echo "$(tput setaf 3)GLaDOS: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
  #   echo "---------------------------------------------------------"
  # else
  #   echo "---------------------------------------------------------"
  #   echo "$(tput setaf 2)GLaDOS: Creating symlink for $file.$(tput sgr 0)"
  #   echo "---------------------------------------------------------"
  #   ln -sf $file $target
  # fi
done

if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing config files.$(tput sgr 0)"
echo "---------------------------------------------------------"

for config in $INSTALLDIR/config/*; do
  target=$HOME/.config/$( basename $config )
  ln -sf $config $target
  # if [ -e $target ]; then
  #   echo "---------------------------------------------------------"
  #   echo "$(tput setaf 3)GLaDOS: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
  #   echo "---------------------------------------------------------"
  # else
  #   echo "---------------------------------------------------------"
  #   echo "$(tput setaf 2)GLaDOS: Creating symlink for ${config}.$(tput sgr 0)"
  #   echo "---------------------------------------------------------"
  #   ln -sf $config $target
  # fi
done