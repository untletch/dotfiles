#!/bin/bash

pip install \
  # formatters and fixers
  black \
  flake8 \
  isort \
  pylama \
  youtube-dl \
  ipython \
  bpython \
  jupyterlab \
  # django and go templates linter and formatter
  djlint \
  # profiler
  scalene \
  # python markdown preview lib
  grip \
  # file manager
  ranger-fm
  # sql formatter
  shandy-sqlfmt[jinjafmt]
  # sql linter and formatter
  sqlfluff

echo "add rust analyzer binary to fish"
# cd ~/.local && mkdir bin
# set -Ua fish_user_paths ~/.local/bin      OR
# set PATH ~/.local/bin $PATH
# curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
# chmod +x ~/.local/bin/rust-analyzer

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

# js packages
sudo npm install --global yarn
yarn config set prefix ~/.yarn
fish_add_path ~/.yarn
yarn global add eslint prettier stylelint

# formatters and linters
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
sudo apt install jq shellcheck
sudo apt install clangtidy clang-format

echo "create js env"
touch js/index.js
cd js && cp $HOME/dotfiles/.eslintrc.js .
npm install -g eslint prettier
npm init -y && eslint --init
cd
# check if '(npx )eslint --init'

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
cargo install du-dust   # check hard drive space
cargo install ripgrep # grep utility
cargo install git-delta # git diff files
cargo install fd-find # find utility
cargo install dua-cli # disk usage analyzer
cargo install bat # cat clone but better
cargo install alacritty # terminal emulator
cargo install cargo-watch # rust file watcher

# problems with ssh keys https://gist.github.com/adamjohnson/5682757
