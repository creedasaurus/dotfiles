{ config, pkgs, ... }:

let homeDir = builtins.getEnv "HOME";
    userName = builtins.getEnv "USER";
    latest = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };

in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userName;
  home.homeDirectory = homeDir;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
 home.packages = with pkgs; [
    latest.atuin
    bat
    bottom
    caddy
    latest.chezmoi
    latest.curl
    delta
    latest.d2
    latest.direnv
    dos2unix
    latest.sqlite
    latest.dua
    duf
    latest.fastmod
    latest.fd
    fswatch
    latest.fzf
    latest.ffmpeg
    fpp
    gawk
    latest.gh
    latest.git
    latest.gitui
    latest.git-lfs
    gnupg
    latest.golangci-lint
    latest.go-task
    latest.graphviz
    latest.htop
    latest.hyperfine
    latest.jaq
    latest.jq
    latest.just
    latest.kubectl
    latest.lazygit
    latest.lsd
    ncurses
    less
    latest.mise
    latest.mosh
    latest.neofetch
    latest.neovim
    latest.nushell
    latest.oha
    latest.pdfcpu
    pipes
    protobuf
    ranger
    latest.ripgrep
    rsync
    latest.rustscan
    latest.scc
    latest.steampipe
    latest.tig
    latest.tmux
    latest.tokei
    tree
    latest.tree-sitter
    latest.trippy
    latest.units
    unzip
    latest.up
    latest.urlscan
    unixtools.watch
    wget
    latest.yq-go
    latest.yt-dlp
    latest.zellij
    zip
    zlib
    latest.zoxide
    latest.zsh
    latest.xz

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/haymd/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
    # EDITOR = "emacs";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
