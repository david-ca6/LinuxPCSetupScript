#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install flatpak software: misc
sudo flatpak install -y flathub com.github.tchx84.Flatseal                      # set flatpak permissions
sudo flatpak install -y flathub com.mattjakeman.ExtensionManager                # gnome extension manager
sudo flatpak install -y flathub com.rafaelmardojai.Blanket                      # bg noise
sudo flatpak install -y flathub com.valvesoftware.Steam                         # steam launcher, mostly used for proton
#sudo flatpak install -y flathub com.chatterino.chatterino                      # twitch chat
sudo flatpak install -y flathub io.gitlab.persiangolf.voicegen                  # tts
sudo flatpak install -y flathub org.gnome.PowerStats                            # power statistic for laptop
sudo flatpak install -y flathub com.wps.office                                  # ms office alternative
sudo flatpak install -y flathub fr.free.hxc2001.HxCFloppyEmulator               # floppy emulator

# install flatpak software: internet, browser, com, email
sudo flatpak install -y flathub com.opera.Opera                                 # browser, main browser
#sudo flatpak install -y flathub com.microsoft.Edge                             # browser, mostly used for ms office and ms teams
#sudo flatpak install -y flathub com.google.Chrome                              # browser used for test
#sudo flatpak install -y flathub org.mozilla.firefox                            # browser used for test
sudo flatpak install -y flathub com.discordapp.Discord                          # communication
#sudo flatpak install -y flathub com.slack.Slack                                # communication
sudo flatpak install -y flathub org.mozilla.Thunderbird                         # email
sudo flatpak install -y flathub org.qbittorrent.qBittorrent                     # torrent
sudo flatpak install -y flathub org.remmina.Remmina                             # ssh and rdp

# install flatpak software: productivity
sudo flatpak install -y flathub org.gnome.clocks                                # world clock
sudo flatpak install -y flathub org.gnome.World.Secrets                         # password manager
sudo flatpak install -y flathub net.rpdev.OpenTodoList                          # todo and notes
sudo flatpak install -y flathub ca.hamaluik.Timecop                             # time tracker
sudo flatpak install -y flathub net.daase.journable                             # journal

# install flatpak software: audio, video, image
sudo flatpak install -y flathub org.gnome.SoundRecorder                         # audio recorder
sudo flatpak install -y flathub org.audacityteam.Audacity                       # audio editing
sudo flatpak install -y flathub com.obsproject.Studio                           # obs studio recording/streaming
sudo flatpak install -y flathub org.kde.kdenlive                                # video editing
sudo flatpak install -y flathub org.videolan.VLC                                # media player
sudo flatpak install -y flathub io.gitlab.theevilskeleton.Upscaler              # upscaller
sudo flatpak install -y flathub io.gitlab.adhami3310.Converter                  # image converter
sudo flatpak install -y flathub org.gimp.GIMP                                   # image editing
sudo flatpak install -y flathub org.blender.Blender                             # 3d editing

# install flatpak software: software/hardware dev
sudo flatpak install -y flathub org.kicad.KiCad                                 # electronic cad
sudo flatpak install -y flathub org.texstudio.TeXstudio                         # latex doc
sudo flatpak install -y flathub net.werwolv.ImHex                               # hex editor
sudo flatpak install -y flathub org.ghidra_sre.Ghidra                           # NSA SRE Framework
sudo flatpak install -y flathub com.sublimetext.three                           # sublime text editor
sudo flatpak install -y flathub io.github.shiftey.Desktop                       # github app
sudo flatpak install -y flathub me.iepure.devtoolbox                            # soft dev, usefull to test color wcag contrast and more


# setup discord rich presence
ln -sf $XDG_RUNTIME_DIR/{app/com.discordapp.Discord,}/discord-ipc-0
mkdir -p ~/.config/user-tmpfiles.d
echo 'L %t/discord-ipc-0 - - - - app/com.discordapp.Discord/discord-ipc-0' > ~/.config/user-tmpfiles.d/discord-rpc.conf
systemctl --user enable --now systemd-tmpfiles-setup.service
