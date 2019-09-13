
#!/bin/bash

. ../distro.sh
. ../helpers.sh

echo_info "Installing termite..."
_install termite

echo_info "Symlink termite config"
mkdir -p ~/.config/termite
ln -sfT ~/.dotfiles/termite/config ~/.config/termite/config
ln -sfT ~/.dotfiles/termite/theme ~/.config/termite/theme
ln -sfT ~/.dotfiles/termite/color/ ~/.config/termite/color

echo_done "Termite configuration!"
