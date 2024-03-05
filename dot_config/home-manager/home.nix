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
    latest.atuin # shell history sync
    bat # better CAT tool
    bottom # another htop tool
    brotli # compression
    latest.broot # another file/folder tui
    latest.buf # generate/manage/lint protobufs
    caddy # local https server
    # - not on aarch64-apple-darwin 
    # latest.cava
    latest.chezmoi # managing dotfiles
    cmakeMinimal # cmake and tools
    latest.curl
    delta # diff with nice colors
    latest.d2 # diagram generating tool
    latest.direnv
    dos2unix # convert files that were DOS to unix
    latest.dua # directory size tool
    duf
    latest.dust
    eternal-terminal # terminal session reconnect
    latest.fastmod
    latest.fd # fast folder search
    fswatch
    latest.fzf # fuzzy finder
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
    latest.hyperfine # benchmark commands
    latest.jaq # another JSON tool
    latest.jc # convert common filetyles to structured JSON
    latest.jq # ALL the json/yaml things
    latest.just
    latest.k6 # load tests
    latest.k9s # k8s tui tool
    latest.kondo # clean dev dirs
    latest.kubectl
    latest.lazygit
    latest.lsd # better ls tool
    ncurses
    less
    latest.mise # install languages
    latest.mosh # stay connected SSH tool
    latest.natscli # tools for NATS server
    latest.neofetch
    latest.neovim
    latest.nushell # best query shell thing
    latest.oha # load tests
    latest.pdfcpu # work with PDFS
    pipes # draw pipes on your screen
    protobuf
    ranger # file/folder tui
    latest.ripgrep # search text fast
    rsync
    latest.rustscan # network port scanning tool
    latest.rustup
    latest.scc # lines of code and cost associated
    # - not on aarch64-apple-darwin 
    # latest.sheldon
    latest.sqlite
    latest.src-cli # sourcegraph cli
    latest.starship # zsh prompt thing
    latest.steampipe # query cloud resources
    latest.tig # git backwards tui
    latest.tmux
    latest.tokei # lines of code tool
    tree
    latest.tree-sitter
    latest.trippy # round trip network tool
    latest.units
    unzip
    latest.up # pipe commands with live preview
    latest.urlscan
    unixtools.watch
    wget
    latest.yazi
    latest.yq-go
    latest.yt-dlp
    latest.zellij # like another tmux
    zip
    zlib
    latest.zoxide # best CD command helper
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
