
. ../distro.sh
. ../helpers.sh

echo_info "Installing NVM..."

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

echo_done "NVM configuration!"
