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
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
 home.packages = with pkgs; [
    latest.act # run github actions locally
    # latest.atuin # shell history sync - BREW
    # bat # better CAT tool - BREW
    latest.bfs # another find replacement, breadth-first search
    # bottom # another htop tool
    brotli # compression
    # latest.broot # another file/folder tui
    # btop # another cool top program
    # latest.buf # generate/manage/lint protobufs
    # caddy # local https server
    # latest.chezmoi # managing dotfiles
    cmakeMinimal # cmake and tools
    # croc # another scp
    # latest.curl
    # delta # diff with nice colors
    # d2 # diagram generating tool
    latest.direnv
    dive # docker image inspection
    # doggo # DNS client for humans
    dos2unix # convert files that were DOS to unix
    # latest.dua # directory size tool
    # duf
    # latest.du-dust
    eternal-terminal # terminal session reconnect
    latest.fastmod
    # latest.fd # fast folder search
    fswatch
    latest.fzf # fuzzy finder
    latest.ffmpeg
    fpp
    fx # terminal JSON viewer
    gawk
    latest.gh
    latest.git
    latest.gitui
    latest.git-lfs
    gnupg
    latest.golangci-lint
    latest.go-task
    latest.gradle
    # graphviz
    latest.htop
    latest.hyperfine # benchmark commands
    latest.jaq # another JSON tool
    # latest.jc # convert common filetyles to structured JSON
    latest.jq # ALL the json/yaml things
    # joshuto # another ranger like terminal file navigator
    latest.just
    latest.jwt-cli # inspect jwt
    latest.k6 # load tests
    # latest.k9s # k8s tui tool -- maybe use brew
    latest.kondo # clean dev dirs
    # krew # k8s plugin control -- maybe use brew
    latest.kubectl
    latest.kustomize
    latest.lazygit
    lolcat # cat with colors
    latest.lsd # better ls tool
    nixos-generators # tool for generating nixos configs
    less
    latest.minikube # little k8s locally
    # latest.mise # install languages -- maybe will use brew for this
    mosh # stay connected SSH tool
    latest.natscli # tools for NATS server
    latest.neofetch
    latest.neovim
    netcat-gnu
    nmap
    latest.nushell # best query shell thing
    oha # load tests
    latest.opentofu
    pdfcpu # work with PDFS
    pipes # draw pipes on your screen
    protobuf
    # ranger # file/folder tui
    latest.ripgrep # search text fast
    rclone
    rsync
    latest.rustscan # network port scanning tool
    latest.rustup
    latest.scc # lines of code and cost associated
    latest.shfmt
    latest.sqlite
    latest.src-cli # sourcegraph cli
    latest.starship # zsh prompt thing
    # steampipe # query cloud resources
    stern # tailing k8s logs made easier
    tealdeer # rust TLDR client
    latest.tig # git backwards tui
    latest.tmux
    latest.tokei # lines of code tool
    tree
    latest.tree-sitter
    latest.trippy # round trip network tool
    latest.ugrep # yet another grep
    latest.units
    unzip
    latest.up # pipe commands with live preview
    # latest.urlscan
    unixtools.watch
    wget
    latest.yazi
    latest.yq-go
    latest.zellij # like another tmux
    zenith # another htop but with graphs
    zip
    # zlib - BREW
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
  home.activation.reportChanges = config.lib.dag.entryAnywhere ''
    if [[ -v oldGenPath ]]; then
      echo "diffing closures"
      $DRY_RUN_CMD nix store diff-closures $oldGenPath $newGenPath
    fi
  '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
