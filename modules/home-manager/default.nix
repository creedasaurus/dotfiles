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

  home = {
    stateVersion = "22.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    # define package definitions for current user environment
    packages = with pkgs; [
      ripgrep
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
      fd
      bat
      rsync
      nix-zsh-completions
      zsh
      exa
      hyperfine
      neovim
      zsh-powerlevel10k
      nix-top
      nixpkgs-fmt
      go
    ];
  };

}
