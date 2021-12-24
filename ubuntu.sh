#!/bin/bash

sudo apt update
sudo apt dist-upgrade
sudo apt autoclean
sudo apt autoremove

echo ">>>> install apps"
sudo apt install \
    git docker docker-compose \
    build-essential libssl-dev checkinstall \
    gnome-tweaks solaar
    
echo ">>>> install snaps apps"  
sudo snap install code --classic  
sudo snap install node --classic
sudo snap install dotnet-sdk --classic
sudo snap install dotnet-sdk --classic --channel=5.0
sudo snap install go --classic  
sudo snap install spotify
sudo snap alias dotnet-sdk.dotnet dotnet

echo ">>>> install chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"
