#!/bin/bash

set -eufo pipefail

defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults write NSGlobalDomain AppleLanguages -array en-US
defaults write NSGlobalDomain AppleLocale en_US
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

defaults write com.apple.dock autohide -bool true

# For the VSCode VIM plugin
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
