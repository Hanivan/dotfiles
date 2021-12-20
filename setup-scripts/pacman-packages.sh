#!/bin/bash

echo -e "Which one your system init?"
echo "1. SystemD"
echo "2. runit"
read -p "(1,2): " init

echo -e "[START]: install general packages..."

while :
do
   shopt -s nocasematch
   case "$init" in
      [1] ) 
         yes | sudo pacman -Syu
         yes | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat ./setup-scripts/resources/pacman-packages` || exit 1 ;;
      [2] )
         yes | sudo pacman -Syu
         yes | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat ./setup-scripts/resources/pacman-packages ./setup-scripts/resources/pacman-packages-runit` || exit 1 ;;
      *) echo -e "Option not found. Try again..."
   esac
   sleep 1
   read -p "(1,2): " init
done


echo -e "[FINISHED]: install general packages\n"
