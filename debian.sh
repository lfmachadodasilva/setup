#!/bin/bash

sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

echo ">>>> update repository"

sudo add-apt-repository ppa:longsleep/golang-backports
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y

echo ">>>> install packages and apps"

sudo apt install -y \
    python3 python-pip \
    git docker docker-compose \
    software-properties-common apt-transport-https wget vim \
    build-essential libssl-dev checkinstall \
    gnome-extensions gnome-tweaks \
    nodejs dotnet-sdk golang-go\
    code \
    spotify-client

echo ">>>> install chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"
