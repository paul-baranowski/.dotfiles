#!/bin/bash
set -e


# Check if homebrew is installed and if not install it
echo "Checking for homebrew"
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

#Brew specific installs
# -- Check if Git is installed
echo "Checking if git is installed"
which -s git || brew install git
# -- Check if node is installed
echo "Checking for node"
if test ! $(node --version); then
    echo "Installing node..."
    brew install node
fi

# -- Installing tmux
echo "installing tmux"
brew install tmux
# -- Clean up
echo "Cleaning up..."
brew cleanup

# -- Install pip
echo "Installing pip"
sudo easy_install pip

# -- Install cask
echo "Installing cask..."
brew tap caskroom/cask

CASKS=(
    docker
    firefox
    google-drive-file-stream
    iterm2
    visual-studio-code
    skype
    slack
    whatsapp
    spectacle
    vlc
)

# -- Install apps
echo "Installing cask apps..."
brew cask install ${CASKS[@]} || true

# -- Install zsh
echo "Checking zsh"
which -s zsh || brew install zsh

# -- Change shell to zsh
echo "Changing shell to zsh"
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)

# -- Install oh-my-zsh
echo "Installing oh-my-zsh and themes"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh || true

# -- Install AWS CLI
echo "Installing aws cli"
sudo mkdir /usr/local/Frameworks || true
sudo chown $(whoami):admin /usr/local/Frameworks || true
brew install awscli || true

# -- Symlinking files
echo -n "SymLinking dotfiles..."
ln -sf $HOME/Desktop/GitHub/.dotfiles/bash/bash_profile $HOME/.bash_profile
ln -sf $HOME/Desktop/GitHub/.dotfiles/vim/.vimrc $HOME/.vimrc
mkdir $HOME/.vim/ || true
ln -sf $HOME/Desktop/GitHub/.dotfiles/vim/colors $HOME/.vim/colors
ln -sf $HOME/Desktop/GitHub/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/Desktop/GitHub/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -sf $HOME/Desktop/GitHub/.dotfiles/.wakatime.cfg $HOME/.wakatime.cfg
echo 'done!'

# -- Configure OS
echo "Configuring OS..."

# -- Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# -- Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# -- Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# -- Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# -- Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# -- Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# -- Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# -- Set Desktop as the default location for new Finder windows
# -- For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# -- Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# -- Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# -- Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# -- Use list view in all Finder windows by default
# -- Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# -- Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# -- Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# -- Show the ~/Library folder
chflags nohidden ~/Library

# -- Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# -- Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# -- Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# -- Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# -- Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true


echo "Aaaannnddd we are done here, Buh Bye!"
