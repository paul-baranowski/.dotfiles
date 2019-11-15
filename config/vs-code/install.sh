#!/usr/bin/env bash
source ../../lib.sh

echo "Installing Visual Studio code extensions and config."

code -v > /dev/null
if [[ $? -eq 0 ]];then
    read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        echo "Installing extensions please wait..."
        code --install-extension christian-kohler.path-intellisense
        code --install-extension akamud.vscode-theme-onedark
        code --install-extension PeterJausovec.vscode-docker
        code --install-extension dbaeumer.vscode-eslint
        code --install-extension jakelucas.code-file-nav
        code --install-extension ecmel.vscode-html-css
        code --install-extension wix.vscode-import-cost
        code --install-extension Zignd.html-css-class-completion
        code --install-extension xabikos.javascriptsnippets
        code --install-extension PKief.material-icon-theme
        code --install-extension eg2.vscode-npm-script
        code --install-extension zhuangtongfa.material-theme
        code --install-extension esbenp.prettier-vscode
        code --install-extension xabikos.reactsnippets
        code --install-extension robinbentley.sass-indented
        code --install-extension formulahendry.terminal
        code --install-extension octref.vetur
        code --install-extension WakaTime.vscode-wakatime
        code --install-extension cssho.vscode-svgviewer
        echo "Extensions for VSC have been installed. Please restart your VSC."
    else
        echo "Skipping extension install.";
    fi

    read -r -p "Do you want to overwrite user config? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        read -r -p "Do you want to back up your current user config? [Y|n] " backupresponse
        if [[ $backupresponse =~ ^(n|no|N) ]];then
            echo "Skipping user config save."
        else
            cp $HOME/Library/Application\ Support/Code/User/settings.json $HOME/Library/Application\ Support/Code/User/settings.backup.json
            echo "Your previous config has been saved to: $HOME/Library/Application Support/Code/User/settings.backup.json"
        fi
        ln -s $HOME/Desktop/GitHub/.dotfiles/config/vs-code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

        echo "New user config has been written. Please restart your VSC."
    else
        echo "Skipping user config overwriting.";
    fi

    echo -n "SymLinking dotfiles..."
        ln -sf $HOME/Desktop/GitHub/.dotfiles/config/vs-code/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
    echo 'done!'
    
else
    error "It looks like the command 'code' isn't accessible."
    error "Please make sure you have Visual Studio Code installed"
    error "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
fi