#!/bin/bash

sudo dnf remove -y code
flatpak install-y  flathub com.visualstudio.code

# install code extension
flatpak run com.visualstudio.code  --install-extension atlassian.atlascode                                    # jira issue
flatpak run com.visualstudio.code  --install-extension GitHub.vscode-pull-request-github                      # github issue
flatpak run com.visualstudio.code  --install-extension GitHub.remotehub                                       # github explorer
flatpak run com.visualstudio.code  --install-extension GitHub.copilot                                         # github copilot ai
flatpak run com.visualstudio.code --install-extension GitHub.copilot-chat                                     # github copilot ai chat
flatpak run com.visualstudio.code  --install-extension Gruntfuggly.todo-tree                                  # todo from code
flatpak run com.visualstudio.code  --install-extension ms-azuretools.vscode-docker                            # container
flatpak run com.visualstudio.code  --install-extension ms-vscode-remote.remote-containers                     # remote contaienr
flatpak run com.visualstudio.code  --install-extension ms-vscode-remote.remote-ssh                            # remote ssh
flatpak run com.visualstudio.code  --install-extension ms-vscode-remote.remote-ssh-edit                       # edit remote ssh
flatpak run com.visualstudio.code  --install-extension ms-vscode.cmake-tools                                  # smake tools support
flatpak run com.visualstudio.code  --install-extension ms-vscode.cpptools                                     # cpp tools
flatpak run com.visualstudio.code  --install-extension ms-vscode.cpptools-extension-pack                      # cpp extension
flatpak run com.visualstudio.code  --install-extension ms-vscode.cpptools-themes                              # cpp theme
flatpak run com.visualstudio.code  --install-extension ms-vscode.remote-explorer                              # remote explorer
flatpak run com.visualstudio.code  --install-extension ms-vsliveshare.vsliveshare                             # video call/code sharing for code review
flatpak run com.visualstudio.code  --install-extension redhat.vscode-yaml                                     # yaml support
flatpak run com.visualstudio.code  --install-extension ritwickdey.LiveServer                                  # live web server
flatpak run com.visualstudio.code  --install-extension twxs.cmake                                             # cmake support
flatpak run com.visualstudio.code --install-extension shd101wyy.markdown-preview-enhanced                     # markdown preview
flatpak run com.visualstudio.code --install-extension ya-technologies.vslabx-extension                        # mplabx support
