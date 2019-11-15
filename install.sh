#!/bin/sh
echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"


echo "APERTURE1" "[1.000]              .,-:;//;:=,               "
echo "APERTURE2" "[1.000]          . :H@@@MM@M#H/.,+%;,          "
echo "APERTURE3" "[1.000]       ,/X+ +M@@M@MM%=,-%HMMM@X/,       "
echo "APERTURE4" "[1.000]     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-     "
echo "APERTURE5" "[1.000]    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.   "
echo "APERTURE6" "[1.000]  ,%MM@@MH ,@%=            .---=-=:=,.  "
echo "APERTURE7" "[1.000]  =@#@@@MX .,              -%HX$$%%%+;  "
echo "APERTURE8" "[1.000] =-./@M@M$                  .;@MMMM@MM: "
echo "APERTURE9" "[1.000] X@/ -$MM/                    .+MM@@@M$ "
echo "APERTURE10" "[1.000],@M@H: :@:                    . =X#@@@@-"
echo "APERTURE11" "[1.000],@@@MMX, .                    /H- ;@M@M="
echo "APERTURE12" "[1.000].H@@@@M@+,                    %MM+..%#$."
echo "APERTURE13" "[1.000] /MMMM@MMH/.                  XM@MH; =; "
echo "APERTURE14" "[1.000]  /%+%$XHH@$=              , .H@@@@MX,  "
echo "APERTURE15" "[1.000]   .=--------.           -%H.,@@@@@MX,  "
echo "APERTURE16" "[1.000]   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.   "
echo "APERTURE17" "[1.000]     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=     "
echo "APERTURE18" "[1.000]       =%@M@M#@$-.=$@MM@@@M; %M%=       "
echo "APERTURE19" "[1.000]         ,:+$+-,/H#MMMMMMM@= =,         "
echo "APERTURE20" "[1.000]               =++%%%%+/:-.             "

INSTALLDIR=$PWD

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Checking for Homebrew installation.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)GLaDOS: Homebrew is installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)GLaDOS: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  echo "---------------------------------------------------------"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Checking for RVM installation.$(tput sgr 0)"
echo "---------------------------------------------------------"

if rvm ; then
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)GLaDOS: RVM already installed.$(tput sgr 0)"
    echo "---------------------------------------------------------"
else
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)GLaDOS: Installing RVM.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    brew install gnupg
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)GLaDOS: Installing Ruby in RVM.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    source "$HOME/.rvm/scripts/rvm";
    rvm install ruby --latest
    rvm use --default
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"

packages=(
  "git"
  "node"
  "tmux"
  "neovim"
  "python3"
  "zsh"
  "ripgrep"
  "fzf"
  "z"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing node neovim package$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing spaceship prompt$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g spaceship-prompt

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing vim linter (vint)$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install vim-vint

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing bash language server$(tput sgr 0)"
echo "---------------------------------------------------------"

npm i -g bash-language-server

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing colorls$(tput sgr 0)"
echo "---------------------------------------------------------"

gem install colorls

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing system fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"

brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

localGit="/usr/local/bin/git"
if ! [[ -f "$localGit" ]]; then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 1)GLaDOS: Invalid git installation. Aborting. Please install git.$(tput sgr 0)"
  echo "---------------------------------------------------------"
  exit 1
fi

# Create backup folder if it doesn't exist
mkdir -p ~/.local/share/nvim/backup

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing oh-my-zsh.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)GLaDOS: oh-my-zsh already installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing zsh-autosuggestions.$(tput sgr 0)"
echo "---------------------------------------------------------"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing vtop.$(tput sgr 0)"
echo "---------------------------------------------------------"
npm install -g vtop

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

# NOTE something is up with script below
# source install/backup.sh
source install/link.sh
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing Space vim-airline theme.$(tput sgr 0)"
echo "---------------------------------------------------------"

cp ~/.config/nvim/space.vim ~/.config/nvim/plugged/vim-airline-themes/autoload/airline/themes/space.vim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Installing tmux plugin manager.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: Setting new preference for iTerm.$(tput sgr 0)"
echo "---------------------------------------------------------"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "---------------------------------------------------------"
echo "$(tput setaf 2)GLaDOS: System update complete. Enjoy your cake! Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0