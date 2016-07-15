#!/bin/bash

##################################################################
# This script creates backups and symlinks/files of the following:
# - i3/config
# - i3/i3blocks.conf
# - i3/compton.conf
# - i3/scripts/*
# - synaptics/70-synaptics.conf
##################################################################

# check were running with root
if [[ $UID != 0 ]]; then
    echo "Run with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

# create backups
[[ -d "~/.i3" ]] && mv ~/.i3 ~/.i3.bak
[[ -d "/etc/X11/xorg.conf.d/70-synaptics.conf" ]] && mv /etc/X11/xorg.conf.d/70-synaptics.conf.bak

# create directories
for d in $(find i3 -type d); do
    mkdir "~/.$d"
done

# create symlinks
for f in $(find i3 -type f); do
    ln -s "$f" "~/.$f"
done

# copy files
cp synaptics/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
