#!/bin/bash

echo -e "Which one your system init?"
echo "1. SystemD"
echo "2. runit"
read -p "(1,2): " init

while :
do
   if [ "$init" -eq 1 ]; then

      sudo systemctl start slim
      sudo systemctl start cups

   else if [ "$init" -eq 2 ]; then
      
      sudo ln -s /etc/runit/sv/slim /run/runit/service
      sudo ln -s /etc/runit/sv/cupsd

      fi
   fi
done
