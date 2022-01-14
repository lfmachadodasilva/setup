#!/bin/bash

## is equivalent to apt-get update && apt-get upgrade##
sudo pacman -Syu --noconfirm

echo ">>>> install all needed software"
sudo pacman -S \
	gnome-tweaks \
	base-devel gcc \
	vim \
	chromium \
	transmission-cli \
	docker docker-compose \
	nodejs npm nvm go \
	git \
	mono dotnet-runtime dotnet-sdk aspnet-runtime \
	--noconfirm

function archinstall()
{	
	if [ $# -eq 0 ]; then
		echo "$bin: must specify at least one package"
		exit 1
	fi
	userName=luizfelipe
	
	for app in "$@"
	do
		echo installing ${app}
	  
		git clone https://aur.archlinux.org/$app.git
		cd $app
		chown -R $userName . 
		makepkg -sirc
		cd ..
		rm -rf $app
		
		echo installed $app
		printf $noColor
	done
}
archinstall visual-studio-code-bin spotify

echo ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"
