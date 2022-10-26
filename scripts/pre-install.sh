#!/bin/bash

echo 'Pre-install script...'

# Check if Homebrew is installed
if [ ! -f "$(which brew)" ]; then
  echo 'Installing homebrew'
  /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo 'Homebrew is installed'
fi

brew tap homebrew/bundle  # Install Homebrew Bundle

# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo 'Installing oh-my-zsh'
  /usr/bin/env sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo 'oh-my-zsh probably already installed'
fi

# Check if tmux plugin manager is installed
TMUX_PLUGDIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TMUX_PLUGDIR" ]; then
  echo "Installing tmux plugin manager"
  git clone https://github.com/tmux-plugins/tpm "$TMUX_PLUGDIR"
fi

