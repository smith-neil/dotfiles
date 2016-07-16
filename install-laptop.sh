#!/bin/bash

packages=(
    "acpi"
    "alsa-utils"
    "compton"
    "feh"
    "gnome-icon-theme"
    "gnome-keyring"
    "i3-gaps-git"
    "i3blocks-gaps-git"
    "i3lock"
    "i3status"
    "networkmanager"
    "openssh"
    "pavucontrol"
    "playerctl"
    "rofi-git"
    "seahorse"
    "xorg-backlight"
    "xorg-xev"
    "xorg-xprop"
)

# check were running with root
if [[ $UID != 0 ]]; then
    echo "Run with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

# adds infinality repos to pacman.conf
echo "\n\n[infinality-bundle]\nServer = http://bohoomil.com/repo/$arch\n\n[infinality-bundle-multilib]\nServer = http://bohoomil.com/repo/multilib/arch\n\n[infinality-bundle-fonts]\nServer = http://bohoomil.com/repo/fonts" >> /etc/pacman.conf

for pkg in "${packages[@]}"; do
    pacaur -Q "$pkg"
    if [ "$?" -eq 1 ]; then
        pacaur -Sq $pkg --noconfirm --noedit 
    fi
done

# installs System San Francisco font
# TODO: add the font's PKGBUILD to the AUR and install like other packages
if [[ ! -d "~/repos" ]] && mkdir ~/repos
cd ~/repos && git clone git@github.com:smith-neil/yosemite-san-francisco-font-git.git
cd yosemite-san-francisco-font-git && makepkg -sri
cd ~
