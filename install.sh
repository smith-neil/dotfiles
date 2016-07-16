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
