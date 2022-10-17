{ inputs, config, lib, pkgs, ... }: {
  nixpkgs = { config = import ./config.nix; };

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    configureBuildUsers = true;

    gc = {
      automatic = true;
      options = "--delete-older-than 10d";
    };
  };
}
