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
# Npm
export PATH=$HOME/.npm-global:$PATH
    '';

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file";
  };
}
