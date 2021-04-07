{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    handbrake
    vlc
    gimp
    steam
    spotify
  ];
}