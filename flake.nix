{
  description = "Nix flake for Creed's home manager and darwin setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; #nixpkgs-21.11-darwin
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, darwin, home-manager, flake-utils, ... }:
    let
      inherit (flake-utils.lib) eachSystemMap;

      isDarwin = system: (builtins.elem system inputs.nixpkgs.lib.platforms.darwin);
      homePrefix = system: if isDarwin system then "/Users" else "/home";
      defaultSystems = [ "aarch64-linux" "aarch64-darwin" "x86_64-darwin" "x86_64-linux" ];

      # generate a base darwin configuration with the
      # specified hostname, overlays, and any extraModules applied
      mkDarwinConfig =
        { system ? "aarch64-darwin"
        , nixpkgs ? inputs.nixpkgs
        , baseModules ? [
            home-manager.darwinModules.home-manager
            ./modules/darwin
          ]
        , extraModules ? [ ]
        }:
        inputs.darwin.lib.darwinSystem {
          inherit system;
          modules = baseModules ++ extraModules;
          specialArgs = { inherit self inputs nixpkgs; };
        };


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
                sessionVariables = {
                  NIX_PATH =
                    "nixpkgs=${nixpkgs}:\${NIX_PATH:+:}$NIX_PATH";
                };
              };
            }
          ]
        , extraModules ? [ ]
        }:
        inputs.home-manager.lib.homeManagerConfiguration rec {
          pkgs = import nixpkgs {
            inherit system;
            overlays = builtins.attrValues self.overlays;
          };
          extraSpecialArgs = { inherit self inputs nixpkgs; };
          modules = baseModules ++ extraModules;
        };
    in
    {
      # Keeping the nix-darwin config separate from home-managers on purpose here.
      # I can then manage setting up "system" level stuff separate from home.
      # Yes, nix-darwin can execute home-manager for me, but I prefer to inspect
      # the output/result before applying it and I dont get that with nix-darwin
      darwinConfigurations = {
        workM1 = mkDarwinConfig {
          extraModules = [];
        };
      };

      darwinConfigurations = {
        randall = mkDarwinConfig {
          extraModules = [ ./profiles/personal.nix ./modules/darwin/apps.nix ];
        };
        work = mkDarwinConfig { extraModules = [ ./profiles/work.nix ]; };
        randall-intel = mkDarwinConfig {
          system = "x86_64-darwin";
          extraModules = [ ./profiles/personal.nix ./modules/darwin/apps.nix ];
        };
        work-intel = mkDarwinConfig {
          system = "x86_64-darwin";
          extraModules = [ ./profiles/work.nix ];
        };
      };

      # The main configurations I can apply.
      # nix build .#homeConfigurations.workServer.activationPackage for example
      homeConfigurations = {
        workServer = mkHomeConfig {
          username = "haymd";
          system = "x86_64-linux";
          extraModules = [ ./profiles/home-manager/work.nix ];
        };
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
