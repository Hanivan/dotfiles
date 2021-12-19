#!/bin/bash

echo -e "[START]: install extenal packages from aur..."

# Check if folder exist
[ -d $HOME/Documents/git ] || mkdir $HOME/Documents/git

# AUR Starting #

# Check if paru is installed
# https://aur.archlinux.org/paru.git
sudo pacman -Qi paru || ./setup-scripts/.scripts/get-helper https://aur.archlinux.org/paru.git
paru

yes "\n" | paru -S --noconfirm --useask --norebuild --needed --batchinstall --mflags --skipinteg --overwrite "*" --nodeps `./setup-scripts/resources/aur-packages` || exit 1

echo -e "[FINISHED]: install external packages\n"
