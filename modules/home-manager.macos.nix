{ config, pkgs, lib, ... }:
{
    # sometimes I comment this out after the first time because it copies it on every build
#   fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
      mosh
  ];
}
