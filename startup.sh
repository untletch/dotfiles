#!/bin/bash

# chmod +x or source
echo "Installing apps from apt"
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install build-essential
install curl
install git
install gparted
install htop
install i3
install ranger
install nasm
install qbittorrent
install tmux
install vim-gtk3
install fish
install vlc
install mpv
install wget
install zeal
install valgrind
install postgresql postgresql-contrib
# used digital ocean docs 
# install pgadmin and check for docs in https://www.pgadmin.org/download/pgadmin-4-apt/
# enter psql
# type \password
# mongodb https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
# mongo compass https://www.mongodb.com/try/download/compass

# install zathura
sudo add-apt-repository ppa:spvkgn/zathura-mupdf
sudo apt install zathura zathura-pdf-mupdf

echo "Installing snaps"
function install_snap {
  which $1 &> /dev/null
  if [ -d "${HOME}/snap" ]; then
    if [ $? -ne 0 ]; then
      echo "Installing: ${1}..."
      sudo snap install $1
    else
      echo "Already installed: ${1}"
    fi
  else
    echo "PLEASE ENABLE SNAPD"
  fi
}

install_snap node --classic
install_snap foliate
install_snap bolls
install_snap pomotroid
install_snap docker
install_snap discord
install_snap postman
# add databases

echo "configure docker to remove sudo"
echo "adding docker as a user group"
sudo groupadd docker
echo "add $USER as member of docker"
sudo usermod -aG docker $USER

echo "Restarting System..."
sudo shutdown

# example script:
#               https://github.com/victoriadrake/dotfiles/blob/master/scripts/install.sh
#               https://github.com/tomnomnom/dotfiles
