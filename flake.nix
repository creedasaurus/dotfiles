{
  description = "Nix flake for Creed's home manager and darwin setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; #nixpkgs-21.11-darwin
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, darwin, home-manager, flake-utils, ... }:
    let
      isDarwin = system: (builtins.elem system inputs.nixpkgs.lib.platforms.darwin);
      homePrefix = system: if isDarwin system then "/Users" else "/home";

      # generate a home-manager configuration usable on any unix system
      # with overlays and any extraModules applied
      # Thanks to https://github.com/kclejeune/system
      mkHomeConfig =
        { username
        , system ? "x86_64-linux"
        , nixpkgs ? inputs.nixpkgs
        , baseModules ? [
            ./modules/home-manager
            {
              home = {
                inherit username;
                homeDirectory = "${homePrefix system}/${username}";
              };
            }
          ]
        , extraModules ? [ ]
        }:
        inputs.home-manager.lib.homeManagerConfiguration rec {
          pkgs = import nixpkgs {
            inherit system;
          };
          extraSpecialArgs = { inherit self inputs nixpkgs; };
          modules = baseModules ++ extraModules;
        };
    in
    {
      darwinConfigurations = {
        workM1 = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./modules/darwin
            ./profiles/darwin/haymd.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.haymd = import ./profiles/home-manager/work.nix;
            }
          ];
        };
      };

      homeConfigurations = {
        workServer = mkHomeConfig {
          username = "haymd";
          system = "x86_64-linux";
          extraModules = [
            ./profiles/home-manager/work.nix
          ];
        };
      };

      # The main configurations I can apply.
      # nix build .#homeConfigurations.workServer.activationPackage for example
      homeConfigurations = {
        # workServer = mkHomeConfig {
        #   username = "haymd";
        #   system = "x86_64-linux";
        #   extraModules = [ ./profiles/home-manager/work.nix ];
        # };
        workPro = mkHomeConfig {
          username = "creedh";
          system = "x86_64-darwin";
          extraModules = [ ./profiles/home-manager/work.nix ];
        };
        workM1 = mkHomeConfig {
          username = "haymd";
          system = "aarch64-darwin";
          extraModules = [ ./profiles/home-manager/work.nix ];
        };
      };
    };
}
