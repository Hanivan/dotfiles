#!/bin/bash

exec_packages() {
   helper=$1
   download_source=$2
   file_source=$3
   echo -e "[START]: install extenal packages from aur..."
   sudo pacman -Qi $helper || ./setup-scripts/.scripts/get-helper $download_source && $helper -S --noconfirm --useask --norebuild --needed --batchinstall --mflags --skipinteg --overwrite "*" --nodeps `cat $file_source` || exit 1
}


# Check if folder exist
[ -d $HOME/Documents/git ] || mkdir $HOME/Documents/git

# AUR Starting #
echo -e "Please select one for aur helpers:"
echo "1. yay"
echo "2. paru"
read -p "(1,2): " helper

while :
do
   shopt -s nocasematch
   case "$helper" in
      # Check if paru\yay is installed
      [1] ) exec_packages "yay" "https://aur.archlinux.org/yay.git" "./setup-scripts/resources/aur-packages" && break ;;
      [2] ) exec_packages "paru" "https://aur.archlinux.org/paru.git" "./setup-scripts/resources/aur-packages" && break ;;
      *) echo -e "Option not found. Try again..." ;;
   esac
   sleep 1
   read -p "(1,2): " helper
done

echo -e "[FINISHED]: install external packages"
