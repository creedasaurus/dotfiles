{ config, pkgs, lib, ... }:
{
  home.stateVersion = "20.09";
  # home.language = {
  #   base = "en_US.UTF-8";
  #   ctype = "en_US.UTF-8";
  # };

  # home.sessionVariables = {
  #   LANG = "en_US.UTF-8";
  # };

  nixpkgs.config.allowUnfree = true;

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  home.packages = with pkgs; [
    # basic utils
    htop
    nmap
    rsync
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
    stdenv.cc.cc.lib
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
