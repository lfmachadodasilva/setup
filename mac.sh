#!/usr/bin/env bash

# check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo ">>>> installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update homebrew recipes
brew update

echo ">>>> installing dev packages"
brew install \
 git node nvm go stern mono openjdk \
 docker kubectl kubectx minikube 
brew install --cask \
 visual-studio-code rider \
 postman mongodb-compass itern2 \
 dotnet 

echo ">>>> installing general packages"
brew install --cask zoom Google-chrome firefox spotify 

if [[ $SHELL != *"zsh" ]]; then
    echo "Installing zsh and setting it as default shell"
    brew install zsh
    chsh -s /usr/local/bin/zsh
fi

if test ! $(whence p10k); then
    echo "Installing/Updating Powerlevel10k"
    curl -fsSL https://raw.githubusercontent.com/romkatv/powerlevel10k/master/config/p10k-lean.zsh -o ~/.p10k.zsh
    echo 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then\n  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"\nfi\nPOWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true\nsource /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme\n[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >>~/.zshrc
    brew install romkatv/powerlevel10k/powerlevel10k
fi

echo ">>>> cleaning up"
brew cleanup

echo ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"

echo ">>>> update os"
softwareupdate -i -a
