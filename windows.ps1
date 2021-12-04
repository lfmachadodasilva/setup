## run this first as admin: set-executionpolicy remotesigned ##

if (Get-Command choco.exe -ErrorAction SilentlyContinue) { } 
else {
    Write-Host ">>>>download and install chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Host ">>>> enable auto confirmation"
choco feature enable -n allowGlobalConfirmation

Write-Host ">>>> install"
& choco upgrade
    | googlechrome postman docker-desktop microsoft-windows-terminal
    # | virtualbox
    | git vscode notepadplusplus spotify
    | dotnetcore-sdk nodejs nodejs golang

Write-Host ">>>> configure git"
git config --global user.name "Luiz Felipe" 
git config --global user.email "lfmachadodasilva@gmail.com"
git config --global core.editor "vim"