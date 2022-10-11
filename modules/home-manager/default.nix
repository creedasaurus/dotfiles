{ self, inputs, config, pkgs, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  imports = [
    ./git.nix
    ./cli
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.home-manager = {
    enable = true;
    path = "${config.home.homeDirectory}/.nixpkgs/modules/home-manager";
  };

  xdg.enable = true;

  home = {
    stateVersion = "22.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    # define package definitions for current user environment
    packages = with pkgs; [
      dua
      ripgrep
      wget
      curl
      coreutils
      less
      watch
      unzip
      zip
      graphviz
      jq
      yq
      ncurses
      protobuf
      zlib
      fd
      bat
      rsync
      rustup
      nix-zsh-completions
      exa
      hyperfine
      neovim
      tmux
      zsh-powerlevel10k
      nix-top
      nixpkgs-fmt
      go
    ];
  };

}
