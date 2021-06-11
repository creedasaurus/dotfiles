{ config, pkgs, lib, ... }:
{
  xdg.enable=true;
  xdg.mime.enable=true;
  fonts.fontconfig.enable = true;

  # I'm including mosh on client machines, but the server has some issues for now. Will maybe add later.
  home.packages = with pkgs; [
      mosh
  ];
}
