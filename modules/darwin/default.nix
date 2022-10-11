{ pkgs, ... }: {
  imports = [
    ./core.nix
    ./brew.nix
    ./preferences.nix
    ../common.nix
  ];
}
