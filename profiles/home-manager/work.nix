{ config, lib, pkgs, ... }: {
  # home.packages = with pkgs; [];

  programs.git = {
    lfs.enable = true;
    userEmail = "WORK@email.com";
    userName = "Creed At WORK";
  };
}
