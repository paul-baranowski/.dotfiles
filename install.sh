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

# Symlinking files
echo -n "SymLinking dotfiles..."
ln -sf $HOME/Desktop/GitHub/.dotfiles/bash/bash_profile $HOME/.bash_profile
ln -sf $HOME/Desktop/GitHub/.dotfiles/.vimrc $HOME/.vimrc
mkdir $HOME/.vim/
ln -sf $HOME/Desktop/GitHub/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/Desktop/GitHub/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -sf $HOME/Desktop/GitHub/.dotfiles/.wakatime.cfg $HOME/.wakatime.cfg
echo 'done!'

# Install oh-my-zsh
echo "Installing oh-my-zsh and themes"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh