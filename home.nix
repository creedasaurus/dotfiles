{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  xdg.enable=true;
  xdg.mime.enable=true;
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
  
  home.username = "creedh";
  home.homeDirectory = "/home/creedh";
  home.stateVersion = "21.05";
  
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  imports = [
    ./homeManagerModules/nvim.nix
    ./homeManagerModules/git.nix
    ./homeManagerModules/fish.nix
    ./homeManagerModules/fonts.nix
  ];

  home.packages = with pkgs; [
     vim
     htop
     nodejs
     deno
     python
     vscode
     go
     exa
     fzf
     tmux
     wget
     tree
     nmap
     mosh
     rsync
     neofetch
  ];
}
