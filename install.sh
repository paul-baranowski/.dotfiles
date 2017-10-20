#!/bin/bash
set -e

# Check if homebrew is installed and if not install it
echo "Checking for homebrew"
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

#Brew specific installs
# -- Check if Git is installed
echo "Checking if git is installed"
which -s git || brew install git
# -- Check if node is installed
echo "Checking for node"
node --version
if [[ $? != 0 ]] ; then
  brew install node
fi
# -- Install zsh
echo "Checking zsh"
which -s zsh || brew install zsh

# Change shell to zsh
echo "Changing shell to zsh"
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh theme
# echo "installing zsh theme"
# npm install -g spaceship-zsh-theme

echo -n "SymLinking dotfiles..."
#Symlink .zshrc and .vimrc
ln -s $HOME/Desktop/GitHub/.dotfiles/.vimrc $HOME/.vimrc
mkdir $HOME/.vim/
ln -s $HOME/Desktop/GitHub/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/Desktop/GitHub/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $HOME/Desktop/GitHub/.dotfiles/.wakatime.cfg $HOME/.wakatime.cfg
echo 'done!'
