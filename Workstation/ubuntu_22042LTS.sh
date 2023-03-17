#!/bin/bash

# setup ubuntu
sudo apt update -y

sudo apt install -y gcc clang make autoconf automake cmake
sudo apt install -y perl
sudo apt install -y curl nano git flatpak

# ssh server
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo ufw allow ssh

#vs code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# library
sudo apt install -y libsdl2-2.0-0 libsdl2-dev
sudo apt install -y libsdl2-image-2.0-0 libsdl2-image-dev
sudo apt install -y libsdl2-mixer-2.0-0  libsdl2-mixer-dev
sudo apt install -y libsdl2-ttf-2.0-0 libsdl2-ttf-dev
sudo apt install -y libsdl2-net-2.0-0 libsdl2-net-dev
sudo apt install -y libcurl4 libcurl4-openssl-dev
sudo apt install -y libnotify-bin libnotify-dev

if lscpu | grep -q 'Intel'; then
    echo Intel
  sudo dnf install -y intel-undervolt                                       # undervolt intel cpu / cpu monitoring
fi
if lscpu | grep -q 'AMD'; then
    echo AMD
fi

sh vscode.sh
sh flatpak.sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
rm go1.20.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# add user to vboxusers
sudo usermod -a -G vboxusers $USER

# making directory
mkdir ~/VMs
mkdir ~/Datas
mkdir ~/Scripts
mkdir ~/Workspaces

if lspci | grep -q 'Intel'; then
    echo Intel
fi
if lspci | grep -q 'AMD'; then
    echo AMD
fi
if lspci | grep -q 'NVIDIA'; then
    echo NVIDIA
fi

# NOTE:
# if a VirtualBox VM manually install VirtualBox Guest Addition

echo ""
echo "" 
echo "Install & Configuration DONE"
echo "Welcome to Ubuntu 22042LTS for CA6 Developper"
echo "Please reboot your computer"