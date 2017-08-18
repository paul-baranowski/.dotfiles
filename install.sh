set -e

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Brew specific installs
brew install git
brew install node
sudo apt-get install zsh

# Change shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)

# Install zsh theme
npm install -g spaceship-zsh-theme


echo -n "SymLinking dotfiles..."
#Symlink .zshrc and .vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
mkdir $HOME/.vim/
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
echo 'done!'
