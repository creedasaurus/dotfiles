{ config, lib, pkgs, ... }: {
  # home.packages = with pkgs; [];

  programs.git = {
    userEmail = "home@email.com";
    userName = "Creed at personal";
  };
}
