{ inputs, config, pkgs, ... }:
{
  imports = [ ./nixpkgs.nix ];

  # environment setup
  environment = {
    loginShell = pkgs.zsh;

    # packages installed in system profile
    systemPackages = with pkgs; [ bash zsh fish dash ksh ];
    shells = with pkgs; [ bash zsh fish dash ksh ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableBashCompletion = false;
  };
  programs.bash = {
    enable = true;
    enableCompletion = false;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
