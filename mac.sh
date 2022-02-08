#!/usr/bin/env bash

chmod u+w /usr/local
 
if test ! $(which brew); then
    echo ">>>> installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# update homebrew recipes
brew update

echo ">>>> installing dev packages"
brew install \
 git go stern mono openjdk \
 docker kubectl kubectx minikube 
brew install --cask \
 visual-studio-code rider \
 postman mongodb-compass itern2 lens \
 dotnet 

echo ">>>> installing general packages"
brew install --cask zoom Google-chrome firefox spotify tiles

echo ">>>> cleaning up brew"
brew cleanup 

if [[ $SHELL != *"zsh" ]]; then
    echo ">>>> installing zsh and setting it as default shell"
    brew install zsh
    chsh -s /usr/local/bin/zsh
fi

if test ! $(whence p10k); then
    echo ">>>> installing/Updating Powerlevel10k"
    curl -fsSL https://raw.githubusercontent.com/romkatv/powerlevel10k/master/config/p10k-lean.zsh -o ~/.p10k.zsh
    echo 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then\n  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"\nfi\nPOWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true\nsource /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme\n[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >>~/.zshrc
    brew install romkatv/powerlevel10k/powerlevel10k
fi

if test ! $(whence k); then
    echo ">>>> setting alias k = kubectl"
    echo "alias k='kubectl'" >>~/.zshrc
fi

if test ! $(whence nvm); then
    echo ">>>> install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
fi

echo ">>>> restart/reload zsh"
source ~/.zshrc

if test $(whence nvm); then
    echo ">>>> install node"
    nvm install 12
    nvm install 14
    nvm install 16
    nvm install 17
    nmv use 17
fi

echo ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"

echo ">>>> update os"
softwareupdate -i -a
