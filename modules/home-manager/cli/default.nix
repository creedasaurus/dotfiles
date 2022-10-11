{ config, pkgs, lib, ... }:
let
  aliases = {
    ls = "exa";
    la = "exa -laF";
    gs = "git status";
    bb = "brazil-build";
    brc = "brazil-recursive-cmd";
    bbb = "brc --allPackages brazil-build";
    bws = "brazil ws";
  };
in
{
  home.packages = with pkgs; [
    neofetch
    tree
    tokei
    fzf
    zsh
  ];

  programs = {
    fzf = rec {
      enable = true;
      defaultCommand = "${pkgs.fd}/bin/fd --type f";
      fileWidgetCommand = "${defaultCommand}";
      fileWidgetOptions = [
        "--preview '${pkgs.bat}/bin/bat --color=always --plain --line-range=:200 {}'"
      ];
      changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d";
      changeDirWidgetOptions =
        [ "--preview '${pkgs.tree}/bin/tree -C {} | head -200'" ];
      historyWidgetOptions = [ ];
    };

    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
      };
    };

    jq.enable = true;
    htop.enable = true;

    bash = {
      enable = true;
      shellAliases = aliases;
    };

    nix-index.enable = true;
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;

      dotDir = ".config/zsh";
      localVariables = {
        LANG = "en_US.UTF-8";
        DEFAULT_USER = "${config.home.username}";
      };

      shellAliases = aliases;

      initExtraBeforeCompInit = ''
        fpath+=(
          $HOMEBREW_PREFIX/share/zsh/site-functions
          $HOMEBREW_PREFIX/share/zsh/functions
          $HOME/.amzn-zsh-funcs/zsh/functions/5.8
          $HOME/.zsh/completion
        )
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

      profileExtra = ''
        if [ -f "/opt/homebrew/bin/brew" ]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [ -f "/usr/local/bin/brew" ]; then
          eval "$(/usr/local/bin/brew shellenv)"
        elif [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
          eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        fi

        . "$HOME/.cargo/env"

        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.toolbox/bin:$PATH"
        export ANDROID_HOME="/Users/haymd/Library/Android/sdk"
        export PATH="$ANDROID_HOME/platform-tools:$PATH"
        export PATH="$ANDROID_HOME/tools:$PATH"

        #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
        export SDKMAN_DIR="$HOME/.sdkman"
        [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

        ${lib.optionalString pkgs.stdenvNoCC.isLinux "[[ -e /etc/profile ]] && source /etc/profile"}
      '';

      oh-my-zsh = {
        enable = true;
      };
    };

  };
}
