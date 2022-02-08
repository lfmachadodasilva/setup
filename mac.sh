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
 git nvm go stern mono openjdk \
 docker kubectl kubectx minikube 
brew install --cask \
 visual-studio-code rider \
 postman mongodb-compass itern2 lens \
 dotnet 

echo ">>>> installing general packages"
brew install --cask zoom Google-chrome firefox spotify 

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

echo ">>>> restart/reload zsh"
source .zshrc

echo ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"

echo ">>>> update os"
softwareupdate -i -a
