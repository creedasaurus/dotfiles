{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    alacritty
  ];
  xdg.configFile."alacritty/alacritty.yml".source = ../configs/alacritty/alacritty.yml;
}
