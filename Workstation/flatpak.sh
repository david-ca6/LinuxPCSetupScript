#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install flatpak software: misc
flatpak install -y flathub com.github.tchx84.Flatseal                      # set flatpak permissions
flatpak install -y flathub com.mattjakeman.ExtensionManager                # gnome extension manager
flatpak install -y flathub com.valvesoftware.Steam                         # steam launcher, mostly used for proton
flatpak install -y flathub io.gitlab.persiangolf.voicegen                  # tts
flatpak install -y flathub org.gnome.PowerStats                            # power statistic for laptop
flatpak install -y org.libreoffice.LibreOffice                             # ms office alternative
flatpak install -y flathub fr.free.hxc2001.HxCFloppyEmulator               # floppy emulator

# install flatpak software: internet, browser, com, email
flatpak install -y flathub com.microsoft.Edge                              # browser, mostly used for ms office and ms teams
flatpak install -y flathub com.google.Chrome                               # browser used for test
flatpak install -y flathub org.mozilla.firefox                             # main browser
flatpak install -y flathub com.discordapp.Discord                          # communication
flatpak install -y flathub org.mozilla.Thunderbird                         # email
flatpak install -y flathub org.qbittorrent.qBittorrent                     # torrent
flatpak install -y flathub org.remmina.Remmina                             # ssh and rdp

# install flatpak software: productivity
flatpak install -y flathub org.gnome.clocks                                # world clock
flatpak install -y flathub org.gnome.World.Secrets                         # password manager
flatpak install -y flathub net.cozic.joplin_desktop                        # todo and notes
flatpak install -y flathub ca.hamaluik.Timecop                             # time tracker

# install flatpak software: audio, video, image
flatpak install -y flathub org.gnome.SoundRecorder                         # audio recorder
flatpak install -y flathub org.audacityteam.Audacity                       # audio editing
flatpak install -y flathub com.obsproject.Studio                           # obs studio recording/streaming
flatpak install -y flathub org.kde.kdenlive                                # video editing
flatpak install -y flathub org.videolan.VLC                                # media player
flatpak install -y flathub org.gimp.GIMP                                   # image editing
flatpak install -y flathub org.blender.Blender                             # 3d editing

# install flatpak software: software/hardware dev
flatpak install -y flathub org.kicad.KiCad                                 # electronic cad
flatpak install -y flathub org.texstudio.TeXstudio                         # latex doc
flatpak install -y flathub net.werwolv.ImHex                               # hex editor
flatpak install -y flathub org.ghidra_sre.Ghidra                           # NSA SRE Framework
flatpak install -y flathub io.github.shiftey.Desktop                       # github app
flatpak install -y flathub cc.arduino.IDE2                                 # arduino ide


# setup discord rich presence
ln -sf $XDG_RUNTIME_DIR/{app/com.discordapp.Discord,}/discord-ipc-0
mkdir -p ~/.config/user-tmpfiles.d
echo 'L %t/discord-ipc-0 - - - - app/com.discordapp.Discord/discord-ipc-0' > ~/.config/user-tmpfiles.d/discord-rpc.conf
systemctl --user enable --now systemd-tmpfiles-setup.service
