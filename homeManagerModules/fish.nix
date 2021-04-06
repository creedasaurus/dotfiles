{ config, pkgs, lib, inputs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "exa -la";
      la = "exa -lah";
      lt = "exa --tree --level=2 --long";
    };
  };
  
  home.packages = with pkgs; [
    exa
    bat
  ];
}