{ config, pkgs, libs, ... }:
{
  home.stateVersion = "21.05";
  
  nixpkgs.config.allowUnfree = true;

  xdg.enable=true;
  xdg.mime.enable=true;
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
  

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  home.packages = with pkgs; [
    htop
    bat
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
