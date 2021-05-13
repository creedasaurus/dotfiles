{ config, pkgs, lib, ... }:
{
  xdg.enable=true;
  xdg.mime.enable=true;
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
}
