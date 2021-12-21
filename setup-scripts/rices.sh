#!/bin/bash

download_rices() {
   config_name=$1

   # Download rice if config dir is empty
   [ -z "$(ls -a ./rices/$config_name | grep -v -w '^\.')" ] && ./setup-scripts/download-rice.sh $config_name
   cd ./rices/$config_name
   # now dir at $config_named
}

backup_files() {
   echo -e "[INFO]: backup necessary files..."

   #backup of .xinitrc, .zshrc, .bashrc, slim.conf, pacman.conf
   cp $HOME/.xinitrc $HOME/.xinitrc-backup
   cp $HOME/.zshrc $HOME/.zshrc-backup
   cp $HOME/.bashrc $HOME/.bashrc-backup
   sudo cp /etc/slim.conf /etc/slim.conf.backup
   sudo cp /etc/pacman.conf /etc/pacman.conf.backup
}

install_fonts() {
   echo -e "[INFO]: installing font..."

   sudo pacman -Qi unzip || yes | sudo pacman -Sy unzip
   [ -d $HOME/.fonts ] || mkdir -p $HOME/.fonts
   unzip ./home/togalite.zip -d ./home
   rm ./home/togalite/readme.txt
   mv ./home/togalite/* $HOME/.fonts
   rm -rf ./home/togalite &> /dev/null
   fc-cache -vf $HOME/.fonts/
}

run_config_files() {
   echo -e "[INFO]: copying config files..."

   # Start copying files #
   # Config File #
   [ -d $HOME/.config ] || mkdir -p $HOME/.config
   cp -r ./config/nvim $HOME/.config
   cp -r ./config/bspwm $HOME/.config
   cp -r ./config/polybar $HOME/.config
   cp -r ./config/sxhkd $HOME/.config
   cp -r ./config/neofetch $HOME/.config
   cp -r ./config/rofi $HOME/.config
   cp -r ./config/kitty $HOME/.config
   cp -r ./config/dunst $HOME/.config
   cp -r ./config/nitrogen $HOME/.config
   cp -r ./config/picom $HOME/.config 
}

config_neovim() {
   # Configuring neovim, is vim-plug before
   echo -e "[INFO]: configuring neovim..."
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   nohup nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qall &
}

run_home_files() {
   replace_user="haniv"

   echo -e "[INFO]: copying home files..."

   # Home File #
   [ -d $HOME/.themes ] || mkdir -p $HOME/.themes
   [ -d $HOME/.icons ] || mkdir -p $HOME/.icons
   [ -d $HOME/Music ] || mkdir -p $HOME/Music
   [ -d $HOME/Music/playlist ] || mkdir -p $HOME/Music/playlist
   [ -d $HOME/Pictures ] || mkdir -p $HOME/Pictures
   [ -d $HOME/Pictures/Wallpaper ] || mkdir -p $HOME/Pictures/Wallpaper
   cp -r ./home/.mpd $HOME
   cp -r ./home/.ncmpcpp $HOME
   cp -r ./home/.bin $HOME
   cp ./home/.zshrc $HOME
   cp ./home/.Xresources $HOME
   cp ./home/.bashrc $HOME
   cp ./home/.xinitrc $HOME
   cp -r ./home/themes/oomox-Red-sars $HOME/.themes
   cp -r ./home/icons/oomox-Red-sars $HOME/.icons
   cp -r ./pictures/* $HOME/Pictures/Wallpaper
   sudo gtk-update-icon-cache

   # Change username from haniv to your username
   sed -i "s/$replace_user/$USER/g" $HOME/.config/nitrogen/*.cfg
   sed -i "s/$replace_user/$USER/g" $HOME/.mpd/*.conf
}

run_etc_files() {
   echo -e "[INFO]: copying etc files..."

   # Etc File #
   sudo mkdir -p /usr/share/slim/themes
   sudo cp ./etc/slim.conf /etc
   sudo cp -r ./etc/slim-theme/sars /usr/share/slim/themes
   sudo cp -r ./etc/xorg.conf.d /etc/X11

   # Add string Color, VerbosePkgLists, ILoveCandy in pacman.conf
   # dumb code
   if ! `grep -Fxq "Color" /etc/pacman.conf` ; then
      sudo sed -i '/#UseSyslog/a Color' /etc/pacman.conf
      if ! `grep -Fxq "VerbosePkgLists" /etc/pacman.conf` ; then
         sudo sed -i '/Color/a VerbosePkgLists' /etc/pacman.conf
      fi
      if ! `grep -Fxq "ILoveCandy" /etc/pacman.conf` ; then
         sudo sed -i '/VerbosePkgLists/a ILoveCandy' /etc/pacman.conf
      fi
   fi
}

config_zsh() {
   GREEN='\033[0;32m'
   NC='\033[0m'
   # oh-my-zsh(https://github.com/ohmyzsh/ohmyzsh) #
   echo -e "[INFO]: configuring zsh, installing ohmyzsh + plugin...\n"

   echo -e "[INFO]: Please type ${GREEN}exit${NC} in zsh shell"
   sleep 2

   # Reference:
   # https://medium.com/tech-notes-and-geek-stuff/install-zsh-on-arch-linux-manjaro-and-make-it-your-default-shell-b0098b756a7a
   echo $SHELL
   sudo pacman -Qi zsh || yes | sudo pacman -Sy zsh
   # oh-my-zsh
   yes "n" | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
   chsh -s $(which zsh)
   echo $SHELL
}

echo -e "[START]: applying rice..."

SETUP_ROOT="$(dirname "$PWD")"
arg=$1

function setup_config {
   rice_name=$1
   # Don't reorder this function if you don't know what are you doing
   download_rices "$rice_name"
   backup_files
   config_zsh
   run_config_files
   config_neovim
   install_fonts
   run_home_files
   run_etc_files

   echo -e "[FINISH]: success applying rice"

   exit 0
}

shopt -s nocasematch
case "$arg" in
   "red-sars" ) setup_config "red-sars" ;;
   *) echo "[ERROR]: no config with name \"$arg\" found" ;;
esac

exit 1
