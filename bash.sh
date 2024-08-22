#!/bin/bash


#install dependiencies

sudo apt install docker.io docker-compose wget curl git -y

sudo apt update -y
sudo apt upgrade -y
sudo apt full-upgrade -y
#sudo
sudo apt autoremove -y

#casa

curl -fsSL https://get.casaos.io | sudo bash

#peppermint
cd 
git clone https://github.com/CooperDActor/peppermint.git
cd peppermint 
#cooper peppermint
sudo docker-compose up -d
cd
#uptime kuma
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1

#the fin
wget https://syd1.mirror.jellyfin.org/files/server/debian/stable/v10.9.9/amd64/jellyfin-server_10.9.9+deb11_amd64.deb
sudo dpkg -i jellyfin-server_10.9.9+deb11_amd64.deb


#brew
echo installing brew - beer
git clone https://github.com/CooperDActor/hot-brewer homebrew

eval "$(homebrew/bin/brew shellenv)"

brew update --force --quiet

chmod -R go-w "$(brew --prefix)/share/zsh"

#flare
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && 

sudo dpkg -i cloudflared.deb
#antmedia
wget https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh -O install_ant-media-server.sh  && chmod 755 install_ant-media-server.sh
sudo ./install_ant-media-server.sh

#kasm
cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.15.0.06fdc8.tar.gz
tar -xf kasm_release_1.15.0.06fdc8.tar.gz
sudo bash kasm_release/install.sh
