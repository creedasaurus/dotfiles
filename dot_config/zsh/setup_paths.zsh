#!/usr/bin/env zsh
# vim: set filetype=zsh :

###### NIX init
if [ -e $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi

if [[ -v HOMEBREW_PREFIX ]]; then
  fpath=(
    $HOMEBREW_PREFIX/share/zsh/site-functions
    $fpath
  )
fi

fpath=(
  $HOME/.nix-profile/share/zsh/site-functions
  $ZDOTDIR/completion
  $fpath
)

# Set zsh history to much bigger
export HISTSIZE=150000
export SAVEHIST=150000
export HISTFILE="$XDG_DATA_HOME/zsh/history"
