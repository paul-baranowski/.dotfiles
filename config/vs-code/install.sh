#!/usr/bin/env bash
source ../../lib.sh

bot "Installing Visual Studio code extensions and config."

code -v > /dev/null
if [[ $? -eq 0 ]];then
    read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        ok "Installing extensions please wait..."
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
        ok "Extensions for VSC have been installed. Please restart your VSC."
    else
        ok "Skipping extension install.";
    fi

    read -r -p "Do you want to overwrite user config? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        read -r -p "Do you want to back up your current user config? [Y|n] " backupresponse
        if [[ $backupresponse =~ ^(n|no|N) ]];then
            ok "Skipping user config save."
        else
            cp $HOME/Library/Application\ Support/Code/User/settings.json $HOME/Library/Application\ Support/Code/User/settings.backup.json
            ok "Your previous config has been saved to: $HOME/Library/Application Support/Code/User/settings.backup.json"
        fi
        ln -s ./settings.json $HOME/Library/Application\ Support/Code/User/settings.json

        ok "New user config has been written. Please restart your VSC."
    else
        ok "Skipping user config overwriting.";
    fi
else
    error "It looks like the command 'code' isn't accessible."
    error "Please make sure you have Visual Studio Code installed"
    error "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
fi