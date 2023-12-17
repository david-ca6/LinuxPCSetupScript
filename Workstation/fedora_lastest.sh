#!/bin/bash

# update package
sudo dnf upgrade --refresh -y
sudo dnf check-update
sudo dnf update

# rpm fusion repo
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# microsoft key and code repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# update package
sudo dnf upgrade --refresh -y
sudo dnf check-update
sudo dnf update

# remove default software
sudo dnf remove -y evolution                                                # email client, use use thunderbird flatpak
sudo dnf remove -y libswscale-free-*                                        # we need to use ffmepg from rpmfusion for better compatibility

# install software
sudo dnf install -y ffmpeg                                                  # video encoder/decoder
sudo dnf install -y htop                                                    # htop
sudo dnf install -y nvtop                                                   # nvidia top
sudo dnf install -y ntfs-3g                                                 # ntfs 
sudo dnf install -y toolbox distrobox                                       # container tool
sudo dnf install -y svn git                                                 # code versioning
sudo dnf install -y python3 python3-pip                                     # python
sudo dnf install -y autoconf automake cmake make clang gcc                  # build tool
sudo dnf install -y kernel-devel kernel-headers                             # kernel header
sudo dnf install -y gnome-tweaks                                            # gnome customization app
sudo dnf install -y gnome-extensions-app                                    # extension for gnome
sudo dnf install -y podman podman-docker                                    # container
sudo dnf install -y lm_sensors                                              # temp sensors
sudo dnf install -y stress                                                  # stress tool test
sudo dnf install -y VirtualBox kmod-VirtualBox                              # virtualbox
sudo dnf install -y xrdp                                                    # remote desktop
sudo dnf install -y wine wine-core                                          # windows compatibility
sudo dnf install -y cockpit                                                 # cockpit remote management
sudo dnf install -y flatpak                                                 # flatpak support (should be already installed)
sudo dnf install -y flatpak-builder                                         # to create flatpak

sudo dnf install code

# install library
sudo dnf install -y SDL2 SDL2-devel
sudo dnf install -y SDL2_image SDL2_image-devel
sudo dnf install -y SDL2_mixer SDL2_mixer-devel
sudo dnf install -y SDL2_ttf SDL2_ttf-devel
sudo dnf install -y SDL2_net SDL2_net-devel
sudo dnf install -y libcurl libcurl-devel
sudo dnf install -y libnotify libnotify-devel

# arm gcc
sudo dnf install -y arm-none-eabi-gcc
sudo dnf install -y arm-none-eabi-binutils-cs
sudo dnf install -y arm-none-eabi-newlib

if lscpu | grep -q 'Intel'; then
    echo Intel
  sudo dnf install -y intel-undervolt                                       # undervolt intel cpu / cpu monitoring
fi
if lscpu | grep -q 'AMD'; then
    echo AMD
fi

sh vscode.sh
sh flatpak.sh
# sh gnome.sh

# start service
sudo systemctl enable cockpit.socket
sudo systemctl start cockpit

sudo systemctl enable xrdp
sudo systemctl start xrdp 

sudo firewall-cmd --permanent --add-port=3389/tcp
sudo firewall-cmd --permanent --add-port=9090/tcp

sudo firewall-cmd --reload 

sudo chcon --type=bin_t /usr/sbin/xrdp 
sudo chcon --type=bin_t /usr/sbin/xrdp-sesman 

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
    sudo dnf install -y xorg-x11-drv-nvidia
    sudo dnf install -y xorg-x11-drv-nvidia-cuda
fi

echo ""
echo "" 
echo "Install & Configuration DONE"
echo "Welcome to Fedora Workstation 37 for CA6 Developper"
echo "Please reboot your computer"
echo ""
echo ""
echo "READ ME:"
echo ""
echo "- MS teams and office 365 to be installed in edge or chrome as webaps"
echo ""
echo "- ~/VMs, ~/Datas, ~/Workspaces, can also be used as mount point for drive"
echo ""
