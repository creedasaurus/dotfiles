#!/bin/bash

echo "Installing asdf plugins"

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add python https://github.com/asdf-community/asdf-python


echo "Set up fzf - post-install"
$(brew --prefix)/opt/fzf/install --xdg --key-bindings --completion --no-update-rc
