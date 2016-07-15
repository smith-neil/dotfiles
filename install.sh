#!/bin/bash

packages=(
    "antigen-git"
    "atom-editor-git"
    "google-chrome"
    "dont-panic-git"
    "firefox"
    "git"
    "nautilus"
    "nerd-fonts-git"
    "powerline-fonts-git"
    "powerline2"
    "rxvt-unicode"
    "slack-desktop"
    "spotify"
    "ttf-dejavu"
    "ttf-font-awesome"
    "unzip"
    "urxvt-resize-font-git"
    "vim"
    "vlc"
    "vundle"
    "xorg-server"
    "zip"
    "zsh"
    "zsh-completions"
)

# check were running with root
if [[ $UID != 0 ]]; then
    echo "Run with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

# install pacaur
pacman -Q pacaur
if [ "$?" -eq 1 ]; then
    echo "downloading pacaur"
fi

for pkg in "${packages[@]}"; do
    pacaur -Q "$pkg"
    if [ "$?" -eq 1 ]; then
        pacaur -Sq $pkg --noconfirm --noedit
    fi
done

# install System San Francisco font
cd /usr/share/fonts/TTF
curl -o https://github.com/supermarin/YosemiteSanFranciscoFont/blob/master/System%20San%20Francisco%20Display%20Bold.ttf
curl -o https://github.com/supermarin/YosemiteSanFranciscoFont/blob/master/System%20San%20Francisco%20Display%20Regular.ttf
curl -o https://github.com/supermarin/YosemiteSanFranciscoFont/blob/master/System%20San%20Francisco%20Display%20Thin.ttf 
curl -o https://github.com/supermarin/YosemiteSanFranciscoFont/blob/master/System%20San%20Francisco%20Display%20Ultralight.ttf
cd ~/
