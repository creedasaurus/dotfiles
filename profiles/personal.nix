{ config, lib, pkgs, ... }: {
  user.name = "creedh";
  hm = { imports = [ ./home-manager/personal.nix ]; };
}
