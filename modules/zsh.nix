{ config, pkgs, lib, inputs, ... }:
{

    home.packages = with pkgs; [
    rsync
    mosh
    tmux
    fzf
    neofetch
    nix-zsh-completions
    less
    jq
    ncurses
    direnv
    eternal-terminal
    exa
    fd
    zsh
    zsh-powerlevel10k
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = false;
    # enableNixDirenvIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    shellAliases = {
      la = "exa -laF";
      ls = "exa";
      gs = "git status";
    };

# magic npm thing that I probably shouldn't do
    profileExtra = ''
# Nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Npm
export PATH=$HOME/.npm-global:$PATH

# JVM
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Rust (from previous)
# source "$HOME/.cargo/env"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export GOPROXY=direct

# Random installs
export PATH="$HOME/.local/bin:$PATH"


    ''
    + lib.optionalString pkgs.stdenv.isDarwin builtins.readFile ../configs/zsh/macbook-pro_zshrc.zsh;

    initExtraFirst = ''
      # Hook direnv
      emulate zsh -c "$(direnv export zsh)"
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      # Enable direnv
      emulate zsh -c "$(direnv hook zsh)"
    '';

    initExtraBeforeCompInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/config/p10k-lean.zsh
    '';

    oh-my-zsh = {
      enable = true;
      # theme = "robbyrussell";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file";
  };
}
