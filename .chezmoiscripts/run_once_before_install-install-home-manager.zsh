#!/usr/bin/env zsh

if (( $+commands[nix-channel] )); then
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
else
  echo "nix-channel does not seem to be available. Please make sure you've installed nix first!"
fi

