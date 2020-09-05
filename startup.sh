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

install vim-gtk
install git
install curl
install i3
install vlc
install zeal
install qbittorrent
install foliate
install htop
install wget
install tmux
install gparted

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
install_snap bolls
install_snap pomotroid
install_snap docker

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
