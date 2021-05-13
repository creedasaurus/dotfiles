{ config, pkgs, lib, ... }:
{
  home.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  home.packages = with pkgs; [
    # basic utils
    awscli
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
    graphviz
    jq
    ncurses
    protobuf
    tig
    zlib
    readline
    watch
    imagemagick
    direnv
    scrcpy
    eternal-terminal
    # languages
    go
    deno
    llvm
    gdb
    perl
    universal-ctags
    # Rust things
    hyperfine
    exa
    tokei
    fd
    bat
    du-dust
    ripgrep
    # go tools
    restic
    gopls
    pdfcpu
  ];
}
