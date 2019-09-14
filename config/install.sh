#!/bin/bash

. ../distro.sh
. ../helpers.sh

echo_info "Symling .profile..."
ln -sfT ~/.dotfiles/config/profile ~/.profile
