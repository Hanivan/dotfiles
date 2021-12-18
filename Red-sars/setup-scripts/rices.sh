#!/bin/bash

echo -e "[START]: applying rice...\n"

replace_user="haniv"

function setup_sars {
   #backup of .xinitrc, .zshrc, .bashrc, slim.conf
   cp $HOME/.xinitrc $HOME/.xinitrc-backup
   cp $HOME/.zshrc $HOME/.zshrc-backup
   cp $HOME/.bashrc $HOME/.bashrc-backup
   sudo cp /etc/slim.conf /etc/slim.conf.backup

   echo -e "[INFO]: installing font...\n"

   sudo pacman -Qi unzip || yes | sudo pacman -Sy unzip
   [ -d $HOME/.fonts ] || mkdir -p $HOME/.fonts
   unzip ./home/togalite.zip
   rm ./home/togalite/readme.txt
   mv ./home/togalite/* $HOME/.fonts
   rm -rf ./home/togalite &> /dev/null
   fc-cache -vf $HOME/.fonts/

   echo -e "[INFO]: copying config files...\n"

   # Start copying files #
   # Config File #
   cp -r ./config/nvim $HOME/.config
   cp -r ./config/bspwm $HOME/.config
   cp -r ./config/sxhkd $HOME/.config
   cp -r ./config/neofetch $HOME/.config
   cp -r ./config/rofi $HOME/.config
   cp -r ./config/kitty $HOME/.config
   cp -r ./config/dunst $HOME/.config
   cp -r ./config/nitrogen $HOME/.config
   cp -r ./config/picom $HOME/.config

   # Change username from haniv to your username
   sed -i "s/$replace_user/$USER/g" $HOME/.config/nitrogen/*.cfg

   # Home File #
   cp -r ./home/.mpd $HOME
   cp -r ./home/.ncmpcpp $HOME
   cp ./home/.zshrc $HOME
   cp ./home/.Xresources $HOME
   cp ./home/.bashrc $HOME
   cp ./home/.xinitrc $HOME
   [ -d $HOME/.themes ] || mkdir -p $HOME/.themes
   cp -r ./home/themes/oomox-Red-sars $HOME/.themes

   # Etc File #
   sudo mkdir -p /usr/share/slim/themes
   sudo cp ./etc/slim.conf /etc
   sudo cp -r ./etc/slim-theme/sars /usr/share/slim/themes
   sudo cp -r ./etc/xorg.conf.d /etc/X11

   # Configuring npm, neovim & oh-my-zsh(https://github.com/ohmyzsh/ohmyzsh) #
   nohup npm i -g npm intelephense sass &
   nohup nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qall &

   echo -e "[INFO]: configuring zsh, installing ohmyzsh + plugin...\n"
   # Reference:
   # https://medium.com/tech-notes-and-geek-stuff/install-zsh-on-arch-linux-manjaro-and-make-it-your-default-shell-b0098b756a7a
   echo $SHELL
   sudo pacman -Qi zsh || yes | sudo pacman -Sy zsh
   zsh
   # oh-my-zsh
   sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
   chsh -s $(which zsh)
   echo $SHELL

   echo -e "[FINISH]: success applying rice\n"
}
setup_sars
