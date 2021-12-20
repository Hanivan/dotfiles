#!/bin/bash

theme=$1

echo -e "Installing all necessary..."

shopt -s nocasematch
case "$theme" in
   "red-sars" ) ./setup-scripts/pacman-packages.sh && ./setup-scripts/install-drivers.sh && ./setup-scripts/aur-packages.sh && ./setup-scripts/npm-packages.sh && ./setup-scripts/rices.sh $theme && ./setup-scripts/start-services.sh ;;
   *) echo -e "[ERROR]: theme with name \"$theme\" found" && exit 1 ;;
esac

echo -e "Don't forget to follow my social media:"
echo -e "Github: @Hanivan"
echo -e "Youtube: Lintasan Video"
echo -e "Let's Rolllllllllllllllllll~~~"
sleep 3
cd
startx
