{ self, inputs, config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./cli
  ];

  xdg.enable = true;

  programs.home-manager = {
    enable = true;
  };

  home = {
    stateVersion = "22.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

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
      gawk
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
