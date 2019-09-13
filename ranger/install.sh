#!/bin/bash

. ../distro.sh
. ../helpers.sh

echo_info "Installing Ranger..."
_install ranger

echo_info "Symlink rc.conf..."
mkdir -p ~/.config/ranger
ln -sfT ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf

echo_done "Ranger configuration!"
