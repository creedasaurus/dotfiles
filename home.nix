{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    historyLimit = 10000;
    terminal = "screen-256color";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    dotDir = ".config/zsh";
    oh-my-zsh = {
      enable = true;
    };

    shellAliases = {
      la = "exa -laF";
      ls = "exa";
      gs = "git status";
      update = "sudo nixos-rebuild switch";
    };

    history = {
      size = 100000;
    };

    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      . "$HOME/.cargo/env"
      
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$HOME/.toolbox/bin:$PATH"
      export ANDROID_HOME="/Users/haymd/Library/Android/sdk"
      export PATH="$ANDROID_HOME/platform-tools:$PATH"
      export PATH="$ANDROID_HOME/tools:$PATH"
    '';

    initExtraFirst = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/config/p10k-lean.zsh
    '';
  };

  nixpkgs.config.allowUnfree = true;

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  home.packages = with pkgs; [
    # Some basics
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
    rsync
    nix-zsh-completions
    zsh
    exa
    hyperfine
    neovim
    zsh-powerlevel10k
    nix-top
    nixpkgs-fmt
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file";
  };
}
