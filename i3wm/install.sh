#!/bin/bash

. ../distro.sh
. ../helpers.sh

echo_info "Symling i3 configuration file..."
mkdir -p ~/.i3
ln -sfT ~/.dotfiles/i3wm/config ~/.i3/config

echo_done "i3wm configuration!"
