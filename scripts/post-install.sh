#!/bin/bash 

set -euo pipefail

echo "Executing post-install script"

. ./scripts/env_helper.sh

if [ -s "$HOMEBREW_PREFIX/opt/fzf/install"  ]; then
   echo "Running FZF install script" 
   /usr/bin/env sh "$HOMEBREW_PREFIX"/opt/fzf/install --xdg --key-bindings --completion --no-update-rc
fi

# Check if LunarVim is installed
echo "Installing lunarvim"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -- --yes --install-dependencies
