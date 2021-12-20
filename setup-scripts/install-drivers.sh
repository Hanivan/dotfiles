#!/bin/bash

echo -e "Please select your graphic card type"
echo "1. amdgpu"
echo "2. intel"
echo "3. nvidia"
echo "(1,2,3): "
read -r model

while :
do
   shopt -s nocasematch
   case "$model" in
      "1" ) pacman -Sy `cat ./setup-scripts/resources/drivers-amdgpu` && break ;;
      "2" ) pacman -Sy `cat ./setup-scripts/resources/drivers-intel` && break ;;
      "3" ) pacman -Sy `cat ./setup-scripts/resources/drivers-nvidia` && break ;;
      *) echo -e "Options not found. try again.."
   esac
   pause 1
done
