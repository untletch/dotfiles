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
install flake8
install ipython
install flake8

echo "cloning dotfiles repository..."
git clone https://github.com/untletch/dotfiles > /dev/null

echo "add alias (l) to bashrc"
echo "alias l='ls -Alh'" >> $HOME/.bashrc

echo "CREATED VIMRC SYMLINK"
[ -d "$HOME/dotfiles" ] && ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

echo "create env directories"
mkdir js python rust

echo "create js env"
touch js/index.js
cd js && cp $HOME/dotfiles/.eslintrc.js .
npm install eslint prettier --save-dev && eslint --init
cd
# check if '(npx )eslint --init'

echo "CREATED VIMRC SYMLINK"
[ -d "$HOME/dotfiles" ] && ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

echo "Copying i3 configs"
cp $HOME/dotfiles/i3/config $HOME
cp $HOME/dotfiles/i3/i3status $HOME/.config

echo "Copying gitconfig"
cp $HOME/dotfiles/.gitconfig $HOME

echo "Copying tmux.conf"
cp $HOME/dotfiles/.tmux.conf $HOME

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# problems with ssh keys https://gist.github.com/adamjohnson/5682757
