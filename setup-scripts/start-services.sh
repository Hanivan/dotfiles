#!/bin/bash

echo -e "Which one your system init?"
echo "1. SystemD"
echo "2. runit"
read -p "(1,2): " init

while :
do
   shopt -s nocasematch
   case "$init" in
      [1] ) 
         sudo systemctl start slim
         sudo systemctl start cups
         break ;;
      [2] ) 
         sudo ln -s /etc/runit/sv/slim /run/runit/service
         sudo ln -s /etc/runit/sv/cupsd /run/runit/service
         break ;;
      *) echo -e "Option not found. Try again..." ;;
   esac
   sleep 1
   read -p "(1,2): " init
done
