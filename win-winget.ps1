##############################
# install
##############################

# install gclould sdk
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
& $env:Temp\GoogleCloudSDKInstaller.exe

# apps
winget install -e --id Google.Chrome
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id MongoDB.Compass.Full
winget install -e --id Docker.DockerDesktop
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id SlackTechnologies.Slack
winget install -e --id Discord.Discord
winget install -e --id PostgreSQL.pgAdmin
winget install -e --id Oracle.VirtualBox

winget install -e --id Git.Git
winget install -e --id OpenJS.NodeJS
# TODO nvm https://github.com/coreybutler/nvm-windows/releases
winget install -e --id GoLang.Go
# winget install -e --id Microsoft.VisualStudio.2019.Community
winget install -e --id Microsoft.VisualStudio.2022.Community
# check if visual studio community will already install dotnet core
# winget install -e --id Microsoft.dotnet

# install wsl
wsl --install
wsl --install --distribution Ubuntu

##############################
# configure
##############################
# change ubuntu to run on wsl 1. For some reason wsl2 is not sharing network 
wsl --set-version Ubuntu 1

git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"
