#!/bin/bash

##############################################################
# This script creates backups and  symlinks for the following:
# - xinitrc
# - Xresources
# - vimrc
# - zshenv
# - zshrc
# - zsh config dir
# - gitconfig
# - atom/config.cson
# - atom/keymap.cson
# - atom/styles.less
# - gtkrc-2.0
# - config/gtk-3.0/settings.ini
# - themes/*
###############################################################

# create backups
[[ -e "~/.xinitrc" ]]          && mv ~/.xinitrc ~/.xinitrc.bak
[[ -e "~/.Xresources" ]]       && mv ~/.Xresources ~/.Xresources.bak
[[ -e "~/.zshenv" ]]           && mv ~/.zshenv ~/.zshenv.bak
[[ -e "~/.zshrc" ]]            && mv ~/.zshrc ~/.zshrc.bak
[[ -d "~/.zsh" ]]              && mv ~/.zsh ~/.zsh.bak
[[ -e "~/.vimrc" ]]            && mv ~/.vimrc ~/.vimrc.bak
[[ -e "~/.gitconfig" ]]        && mv ~/.gitconfig ~/.gitconfig.bak
[[ -e "~/.gtkrc-2.0" ]]        && mv ~/.gtkrc-2.0 ~/.gtkrc-2.0.bak
[[ -d "~/.config/gtk-3.0" ]]   && mv ~/.config/gtk-3.0 ~/.config/gtk-3.0.bak
[[ -e "~/.atom/config.cson" ]] && mv ~/.atom/config.cson ~/.atom/config.cson.bak
[[ -e "~/.atom/keymap.cson" ]] && mv ~/.atom/keymap.cson ~/.atom/keymap.cson.bak
[[ -e "~/.atom/styles.less" ]] && mv ~/.atom/styles.less ~/.atom/styles.less.bak
[[ -d "~/.themes" ]]           && mv ~/.themes ~/.themes.bak

# create directories
[[ ! -d "~/.atom" ]]           && mkdir ~/.atom
[[ ! -d "~/.config/gtk-3.0" ]] && mkdir ~/.config/gtk-3.0
for d in $(find (zsh|themes) -type d); do
    mkdir "~/.$d"
done

# create symlinks
ln -s xinitrc ~/.xinitrc
ln -s Xresources ~/.Xresources
ln -s gitconfig ~/.gitconfig
ln -s vimrc ~/.vimrc
ln -s zshenv ~/.zshenv
ln -s zshrc ~/.zshrc
for f in $(find (zsh|themes) -type f); do
    ln -s "$f" "~/.$f" 
done
