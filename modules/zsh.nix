{ config, pkgs, lib, inputs, ... }:
{

    home.packages = with pkgs; [
    rsync
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

    shellAliases = {
      la = "exa -laF";
      ls = "exa";
      gs = "git status";
    };

###
# SETTING UP the .ZSHENV
###
    envExtra = ''

# JVM
export SDKMAN_DIR="$HOME/.sdkman"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOPROXY=direct

'' + lib.optionalString pkgs.stdenv.isLinux (builtins.readFile ../configs/zsh/zshenv_path.zsh);


###
# Setting up PROFILE
###
profileExtra = lib.optionalString pkgs.stdenv.isDarwin (builtins.readFile ../configs/zsh/zshenv_path.zsh) + ''

# Profile things
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

    '' + lib.optionalString pkgs.stdenv.isLinux ''
# LIBS
export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib
    '' + lib.optionalString pkgs.stdenv.isDarwin (builtins.readFile ../configs/zsh/macbook-pro_zshrc.zsh);


###
# Setting up .ZSHRC
###
    initExtraFirst = ''

# Hook direnv
# emulate zsh -c "$(direnv export zsh)"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
  source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
fi

# Enable direnv
emulate zsh -c "$(direnv hook zsh)"
    '';

###
# PRE COMPINIT
###
    initExtraBeforeCompInit = lib.optionalString pkgs.stdenv.isDarwin ''
# I use brew for asdf on macos
. /usr/local/opt/asdf/asdf.sh
'' + lib.optionalString pkgs.stdenv.isLinux ''
# I use git for asdf on linux
. $HOME/.asdf/asdf.sh
'' + ''
fpath+=(
    /usr/local/share/zsh/site-functions
    $ASDF_DIR/completions
    $HOME/.amzn-zsh-funcs/zsh/functions/5.8
)

source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/config/p10k-lean.zsh
    '';

###
# End of .ZSHRC
###
    initExtra = ''
'';

    oh-my-zsh = {
      enable = true;
    };
  };


  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file";
  };
}
