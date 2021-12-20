#!/bin/bash

theme=$1

echo -e "Installing all necessary...\n"

shopt -s nocasematch
case "$theme" in
   "red-sars" ) ./setup-scripts/pacman-packages.sh && ./setup-scripts/install-drivers.sh && ./setup-scripts/aur-packages.sh && ./setup-scripts/npm-packages.sh && ./setup-scripts/rices.sh $theme && ./setup-scripts/start-services.sh ;;
   *) echo -e "[ERROR]: theme with name \"$theme\" found" && exit 1 ;;
esac

echo -e "This rices has successfuly installed!\n\n"
echo -e "Don't forget to follow my social media:\n"
echo -e "Github: @Hanivan\n"
echo -e "Youtube: Lintasan Video\n\n"
echo -e "Let's Rolllllllllllllllllll~~~"
sleep 3
cd
startx
