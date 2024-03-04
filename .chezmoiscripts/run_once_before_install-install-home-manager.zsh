#!/usr/bin/env zsh

if (( $+commands[home-manager] )); then
  echo "Nix home-manager is already installed"
else
  echo "attempting to install home-manager" 
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
fi
