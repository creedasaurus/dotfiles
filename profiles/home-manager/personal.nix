{ config, lib, pkgs, ... }: {
  # home.packages = with pkgs; [];

  programs.git = {
    userEmail = "creedasaurus@gmail.com";
    userName = "Creed Haymond";
  };
}
