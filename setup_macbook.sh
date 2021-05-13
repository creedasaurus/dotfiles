#!/usr/bin/env bash
echo "Starting setup"

# install xcode CLI
xcode-select --install

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    asdf
    borgbackup/tap/borgbackup-fuse
    gpg
)
echo "Installing packages..."
brew install ${PACKAGES[@]}


echo "Installing casks..."
CASKS=(
    # chat
    slack
    discord
    element

    # media
    spotify
    vlc
    kap
    gimp
    obs

    # development
    iterm2
    jetbrains-toolbox
    android-platform-tools
    docker
    insomnia
    postman
    joplin
    fork
    macfuse
    sublime-text
    visual-studio-code
    wireshark

    # macos
    scroll-reverser
    caffeine
    rectangle

    # browser
    brave-browser
    google-chrome
    firefox

    # other
    vorta
)

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

echo "Cleaning up..."
brew cleanup


# Install SDKMan for Java versions
curl -s "https://get.sdkman.io?rcupdate=false" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 11.0.10.j9-adpt
sdk install kotlin
sdk install gradle
sdk install maven
sdk install visualvm


echo "Macos Settings"
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 30
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1



