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
        macbook-pro = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, config, ... }:
            {
              xdg.configFile."nix/nix.conf".source = ./configs/nix/nix.conf;
              nixpkgs.config = import ./configs/nix/config.nix;
              nixpkgs.overlays = overlays;
              imports = [
                ./modules/home-manager.nix
                ./modules/zsh.nix
                ./modules/fonts.nix
                ./modules/git.nix
                ./modules/nvim.nix
                ./modules/nix.nix
                ./modules/rust.nix
                ./modules/alacritty.nix
              ];
              # programs.zsh.initExtra = builtins.readFile ./configs/zsh/macbook-pro_zshrc.zsh;
              # xdg.configFile."terminfo".source = ./configs/terminfo/terminfo_mac;
            };
          system = "x86_64-darwin";
          homeDirectory = "/Users/creedh";
          username = "creedh";
        };
        linux-desktop = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
              xdg.configFile."nix/nix.conf".source = ./configs/nix/nix.conf;
              nixpkgs.config = import ./configs/nix/config.nix;
              nixpkgs.overlays = overlays;
              imports = [
                ./modules/home-manager.nix
                ./modules/zsh.nix
                ./modules/fonts.nix
                ./modules/git.nix
                ./modules/nvim.nix
                ./modules/chat.nix
                ./modules/media.nix
              ];
            };
          system = "x86_64-linux";
          homeDirectory = "/home/creedh";
          username = "creedh";
        };
      };
      macbook-pro = self.homeConfigurations.macbook-pro.activationPackage;
      linux-desktop = self.homeConfigurations.linux-desktop.activationPackage;
    };
}
