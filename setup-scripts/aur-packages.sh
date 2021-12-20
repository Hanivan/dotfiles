#!/bin/bash

echo -e "[START]: install extenal packages from aur..."

# Check if folder exist
[ -d $HOME/Documents/git ] || mkdir $HOME/Documents/git

# AUR Starting #
echo -e "Please select one for aur helpers:"
echo "1. yay"
echo "2. paru"
echo "(1,2): "
read -r helper

while :
do
   case "$helper" in
      # Check if paru\yay is installed
      "1" ) sudo pacman -Qi yay || ./setup-scripts/.scripts/get-helper https://aur.archlinux.org/yay.git && yay -S --noconfirm --useask --norebuild --needed --batchinstall --mflags --skipinteg --overwrite "*" --nodeps `cat ./setup-scripts/resources/aur-packages` || exit 1
&& break ;;
      "2" ) sudo pacman -Qi paru || ./setup-scripts/.scripts/get-helper https://aur.archlinux.org/paru.git && paru -S --noconfirm --useask --norebuild --needed --batchinstall --mflags --skipinteg --overwrite "*" --nodeps `cat ./setup-scripts/resources/aur-packages` || exit 1
&& break ;;
      *) echo -e "Option not found. Try again..."
   esac
done

echo -e "[FINISHED]: install external packages"
