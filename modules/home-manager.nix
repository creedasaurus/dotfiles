{ config, pkgs, libs, ... }:
{
  home.stateVersion = "20.09";

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

}