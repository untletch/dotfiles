#!/bin/bash

echo "Install pip packages"
function install {
  which $1 &> /dev/null
  if [ -d "$HOME/miniconda3" ]; then
    if [ $? -ne 0 ]; then
      echo "Installing: ${1}..."
      pip install $1
    else
      echo "Already installed: ${1}"
    fi
  else
    echo "PLEASE INSTALL MINICONDA"
  fi
}
install black
install flake8
install ipython
install jupyterlab
# python markdown preview lib
install grip

echo "cloning dotfiles repository..."
git clone https://github.com/untletch/dotfiles > /dev/null

echo "add alias (l) to bashrc"
echo "alias l='ls -Alh'" >> $HOME/.bashrc

echo "add rust analyzer binary to fish"
# cd ~/.local && mkdir bin
# set -Ua fish_user_paths ~/.local/bin      OR
# set PATH ~/.local/bin $PATH
# curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
# chmod +x ~/.local/bin/rust-analyzer

echo "CREATED VIMRC SYMLINK"
[ -d "$HOME/dotfiles" ] && ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

echo "add sites to hosts"
sudo su
echo "0.0.0.0 twitter.com" >> /etc/hosts
echo "0.0.0.0 lichess.org" >> /etc/hosts
echo "0.0.0.0 www.reddit.com"  >> /etc/hosts
echo "0.0.0.0 old.reddit.com"  >> /etc/hosts
echo "0.0.0.0 www.youtube.com"  >> /etc/hosts
exit

echo "create env directories"
mkdir js python rust cpp

echo "create js env"
touch js/index.js
cd js && cp $HOME/dotfiles/.eslintrc.js .
npm install -g eslint prettier
npm init -y && eslint --init
cd
# check if '(npx )eslint --init'

echo "CREATED VIMRC SYMLINK"
[ -d "$HOME/dotfiles" ] && ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

# use pulseaudio to control volume
echo "i3 volume notifications"
git clone https://github.com/hastinbe/i3-volume.git ~/i3-volume

echo "Copying i3 configs"
cp $HOME/dotfiles/i3/config $HOME
cp $HOME/dotfiles/i3/i3status $HOME/.config

echo "Copying gitconfig"
cp $HOME/dotfiles/.gitconfig $HOME

echo "Copying tmux.conf"
cp $HOME/dotfiles/.tmux.conf $HOME

echo "Make fish Default"
# use https://www.peachpit.com/articles/article.aspx?p=659655&seqNum=3
sudo chsh -s `which fish`
conda init fish

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install rust command line utitlities
cargo install dust   # check hard drive space
cargo install ripgrep # grep utility
cargo install git-delta # git diff files
cargo install fd-find # find utility

# problems with ssh keys https://gist.github.com/adamjohnson/5682757
