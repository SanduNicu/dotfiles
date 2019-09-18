#!/bin/bash

. ../distro.sh
. ../helpers.sh

echo_info "Installing dunst..."
_install dunst

echo_info "Symlink dunstrc..."

mkdir -p ~/.config/dunst
ln -sfT ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

echo_done "dunstrc configuration!"
