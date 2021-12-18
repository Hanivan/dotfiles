#!/bin/bash

echo -e "Installing all necessary...\n"

./setup-scripts/pacman-packages.sh && ./setup-scripts/aur-packages.sh && ./setup-scripts/rices.sh

echo -e "This rices has successfuly installed!\n"
echo -e "Don't forget to follow my social media:\n"
echo -e "Github: @Hanivan\n"
echo -e "Youtube: Lintasan Video\n"
echo -e "Let's Rolllllllllllllllllll~~~"
sleep 3
cd
startx
