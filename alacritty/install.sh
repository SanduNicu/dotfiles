#!/bin/bash

. ../distro.sh
. ../helpers.sh

if !(command_exists alacritty); then
  echo_info "Installing Alacritty..."
  _install alacritty  

  git clone https://github.com/alacritty/alacritty.git
  cd alacritty
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

  cd ..
  rm -rf alacritty

  echo_info "Symlinking alacritty.yml..."
  mkdir -p ~/.config/alacritty
  ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

  echo_done "Alacritty installed!"
else
  echo_done "Alacritty already installed!"
fi
