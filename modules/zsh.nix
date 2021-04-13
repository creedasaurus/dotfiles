{ config, pkgs, lib, inputs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    shellAliases = {
      la = "exa -laF";
      ls = "exa";
      gs = "git status";
    };

# magic npm thing that I probably shouldn't do
    profileExtra = ''
# Nix
source $HOME/.nix-profile/etc/profile.d/nix.sh

# Npm
export PATH=$HOME/.npm-global:$PATH

# Ruby
eval "$(rbenv init -)"

# Python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# JVM
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Rust
source "$HOME/.cargo/env"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
    '';

    oh-my-zsh = {
      enable = true;
      # theme = "robbyrussell";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file";
  };
}
