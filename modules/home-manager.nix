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
    # basic utils
    htop
    nmap
    rsync
    mosh
    tmux
    tree
    fzf
    wget
    neofetch
    curl
    coreutils
    less
    watch
    unzip
    zip
    # languages
    go
    nodejs
    deno
    python
    llvm
    gdb
    # Editor
    vscodium
    # Rust things
    exa
    fd
    bat
    du-dust
    ripgrep
  ];
}
