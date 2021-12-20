#!/bin/bash

exec_packages() {
   file_source=$1
   echo -e "[START]: install general packages..."
   yes | sudo pacman -Syu
   yes | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat $file_source` || exit 1
}

echo -e "Which one your system init?"
echo "1. SystemD"
echo "2. runit"
read -p "(1,2): " init

while :
do
   shopt -s nocasematch
   case "$init" in
      [1] ) exec_packages "./setup-scripts/resources/pacman-packages" ;;
      [2] ) exec_packages "./setup-scripts/resources/{pacman-packages,pacman-packages-runit}" ;;
      *) echo -e "Option not found. Try again..." ;;
   esac
   sleep 1
   read -p "(1,2): " init
done


echo -e "[FINISHED]: install general packages\n"
