{
  description = "Example home-manager from non-nixos system";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs.LS_COLORS = {
    url = "github:trapd00r/LS_COLORS";
    flake = false;
  };

  outputs = { self, ... }@inputs:
    let
      overlays = [
        inputs.neovim-nightly-overlay.overlay
        (final: prev: { LS_COLORS = inputs.LS_COLORS; })
      ];
    in
    {
      homeConfigurations = {
        linux-desktop = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
              xdg.configFile."nix/nix.conf".source = ./configs/nix/nix.conf;
              nixpkgs.config = import ./configs/nix/config.nix;
              nixpkgs.overlays = overlays;
              imports = [
                ./modules/git.nix
                ./modules/fonts.nix
                ./modules/home-manager.nix
                ./modules/zsh.nix
                ./modules/nvim.nix
                ./modules/vscode.nix
              ];
            };
          system = "x86_64-linux";
          homeDirectory = "/home/creedh";
          username = "creedh";
        };
      };
      linux-desktop = self.homeConfigurations.linux-desktop.activationPackage;
    };
}
