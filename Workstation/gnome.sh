#!/bin/bash

flatpak run com.mattjakeman.ExtensionManager &>/dev/null &

echo ""
echo "Manual Step:"
echo "In ExtensionManager"
echo "Go to Browse and install the folowing extension:"
echo "- AppIndicator and KStatusNotifierItem Support"
echo "- Desktop Icons NG (DING)"
echo "- Removable Drive Menu"
echo "- Dash to Panel"
echo "- ArcMenu"
echo "- ddterm"
echo ""
echo "- import ArcMenu.conf in ArcMenu"
echo "- import DashToPanel.conf in Dash To Panel"
echo ""
echo "Press a key to continue"
read -n 1 -s

# enable/disable gnome extensions
gnome-extensions disable launch-new-instance@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable places-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable window-list@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable background-logo@fedorahosted.org

gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable ddterm@amezin.github.com
gnome-extensions enable arcmenu@arcmenu.com
gnome-extensions enable ding@rastersoft.com

# set gnome settings
gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true