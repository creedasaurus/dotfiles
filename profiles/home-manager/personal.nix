{ config, lib, pkgs, ... }: {
  # home.packages = with pkgs; [];
  imports = [ ../../modules/home-manager ];

  programs.git = {
    userEmail = "creedasaurus@gmail.com";
    userName = "Creed Haymond";
  };
}
