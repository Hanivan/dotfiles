#!/bin/bash

list_theme() {
   echo -e "[ERROR]: theme with name \"$theme\" found"
   echo -e "[TIPS]: ./setup.sh <THEME-NAME>\n"
   echo -e "+======= Available Theme =======+"
   echo -e "+-------------------------------+"
   echo -e "| - Red-sars                    |"
   echo -e "+-------------------------------+"

   exit 1
}

theme=$1

echo -e "Installing all necessary..."

shopt -s nocasematch
case "$theme" in
   "red-sars" ) ./setup-scripts/pacman-packages.sh && ./setup-scripts/install-drivers.sh && ./setup-scripts/aur-packages.sh && ./setup-scripts/npm-packages.sh && ./setup-scripts/rices.sh $theme && ./setup-scripts/start-services.sh ;;
   *) list_theme ;;
esac

echo -e "Don't forget to follow my social media:"
echo -e "Github: @Hanivan"
echo -e "Youtube: Lintasan Video"
echo -e "Let's Rolllllllllllllllllll~~~"
sleep 3
cd
startx
