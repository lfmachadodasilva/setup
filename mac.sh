#!/usr/bin/env bash

# check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo ">>>> installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update homebrew recipes
brew update

echo ">>>> installing dev packages"
brew install git node docker go
brew install --cask dotnet visual-studio-code postman rider

echo ">>>> installing general packages"
brew install --cask zoom google-chrome spotify

echo ">>>> cleaning up"
brew cleanup

echo ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"

echo ">>>> update os"
softwareupdate -i -a