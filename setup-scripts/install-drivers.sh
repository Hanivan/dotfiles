#!/bin/bash

exec_packages() {
   file_source=$1
   echo -e "[START]: install video drivers..."
   yes | sudo pacman -Sy --needed --overwrite "*" --nodeps --nodeps `cat $file_source` || exit 1
}

echo -e "Please select your graphic card type"
echo "1. amdgpu"
echo "2. intel"
echo "3. nvidia"
read -p "(1,2,3): " model

while :
do
   shopt -s nocasematch
   case "$model" in
      [1] ) exec_packages "./setup-scripts/resources/drivers-amdgpu" && break ;;
      [2] ) exec_packages "./setup-scripts/resources/drivers-intel" && break ;;
      [3] ) exec_packages "./setup-scripts/resources/drivers-nvidia" && break ;;
      *) echo -e "Options not found. Try again.." ;;
   esac
   sleep 1
   read -p "(1,2,3): " model
done

echo -e "[FINISHED]: install video drivers"
