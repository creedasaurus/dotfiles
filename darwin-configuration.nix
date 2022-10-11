{ config, pkgs, ... }:
{
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
  };

  homebrew = {
    enable = true;
    brews = [
      "imagemagick"
      "starship"
    ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  programs.bash.enable = true;

  system.defaults = {
    NSGlobalDomain.InitialKeyRepeat = 30;
    NSGlobalDomain.KeyRepeat = 1;
    dock.autohide = true;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 4;
}
