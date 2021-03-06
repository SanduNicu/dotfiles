#!/bin/bash

. ../distro.sh
. ../helpers.sh

echo_info "Installing rofi..."
_install rofi

echo_info "Symlink rofi config"
mkdir -p ~/.config/rofi
ln -sfT ~/.dotfiles/rofi/config ~/.config/rofi/config

echo_done "Rofi configuration!"
