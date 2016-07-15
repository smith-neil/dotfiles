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

# install pacaur
pacman -Q pacaur
if [ "$?" -eq 1 ]; then
    echo "downloading pacaur"
fi

for pkg in "${packages[@]}"; do
    pacaur -Q "$pkg"
    if [ "$?" -eq 1 ]; then
        # pacaur -Sq $pkg --noconfirm --noedit
        echo "downloading $pkg"
    fi
done

