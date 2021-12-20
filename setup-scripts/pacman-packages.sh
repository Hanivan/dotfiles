#!/bin/bash

echo -e "Which one your system init?"
echo "1. SystemD"
echo "2. runit"
read -p "(1,2): " init

echo -e "[START]: install general packages..."

if [ "$init" -eq 1 ]; then
   yes | sudo pacman -Syu
   yes | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat ./setup-scripts/resources/pacman-packages` || exit 1
else if [ "$init" -eq 2 ]; then
   yes | sudo pacman -Syu
   yes | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat ./setup-scripts/resources/pacman-packages ./setup-scripts/resources/pacman-packages-runit` || exit 1
   fi
fi

echo -e "[FINISHED]: install general packages\n"
