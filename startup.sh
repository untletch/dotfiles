#!/bin/bash

# chmod +x or source
sudo apt install \
	build-essential \
	curl \
	git \
	gparted \
	htop \
	i3 \
	ranger \
	nasm \
	qbittorrent \
	tmux \
	vim-gtk3 \
	xterm \
	fish \
	cmake \
	vlc \
	mpv \
	wget \
	zeal \
	valgrind \
	postgresql \
	postgresql-contrib \
	xautolock

# apt packages for python3
sudo apt install \
	zlib1g-dev \
	libbz2-dev \
	libsqlite3-dev \
	libgdbm-dev \
	libssl-dev \
	libncurses5-dev \
	libreadline-dev \
	liblzma-dev \
	tk-dev

# installing snaps
sudo snap install go --classic
sudo snap install pypy3 --classic
sudo snap install node --classic
sudo snap install bolls
sudo snap install discord
sudo snap install docker
sudo snap install chromium
sudo snap install postman

# pyenv
curl https://pyenv.run | bash

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install pgadmin/postgres
# used digital ocean docs
# install pgadmin and check for docs in https://www.pgadmin.org/download/pgadmin-4-apt/
# sudo -u <user> psql
# ALTER USER <user> PASSWORD 'password'
# cp /usr/pgadmin4/bin/pgadmin4 ~/bin/
# mongodb https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
# mongo compass https://www.mongodb.com/try/download/compass

# install zathura
sudo apt install zathura zathura-djvu zathura-pdf-poppler

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
