{ config, pkgs, lib, ... }:
{
  home.stateVersion = "21.05";

  nixpkgs.config.allowUnfree = true;

  # xdg.enable=true;
  # xdg.mime.enable=true;
  # targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;

  home.activation = {
    copyApplications = let
      apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
    in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      baseDir="$HOME/Applications/Home Manager Apps"
      if [ -d "$baseDir" ]; then
        rm -rf "$baseDir"
      fi
      mkdir -p "$baseDir"
      for appFile in ${apps}/Applications/*; do
        target="$baseDir/$(basename "$appFile")"
        $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
        $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
      done
    '';
  };

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  home.packages = with pkgs; [
    # basic utils
    htop
    nmap
    rsync
    mosh
    tmux
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
    # languages
    go
    nodejs
    deno
    python3
    llvm
    gdb
    # Editor
    vscodium
    # Rust things
    exa
    fd
    bat
    du-dust
    ripgrep
  ];
}
