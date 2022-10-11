{ inputs, config, pkgs, ... }:
let
  inherit (pkgs.stdenvNoCC) isAarch64 isAarch32;
in
{
  # environment setup
  environment = {
    loginShell = pkgs.zsh;
    etc = { darwin.source = "${inputs.darwin}"; };
    # Use a custom configuration.nix location.
    # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix

    # packages installed in system profile
    # systemPackages = [ ];
  };

  homebrew.brewPrefix = if isAarch64 || isAarch32 then "/opt/homebrew/bin" else "/usr/local/bin";

  # auto manage nixbld users with nix darwin
  nix = {
    configureBuildUsers = true;
    nixPath = [ "darwin=/etc/${config.environment.etc.darwin.target}" ];
    extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
      experimental-features = nix-command flakes
    '';
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  programs.bash.enable = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}