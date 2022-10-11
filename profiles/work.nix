{ config, lib, pkgs, ... }: {
  user.name = "haymd";
  hm = { imports = [ ./home-manager/work.nix ]; };
}
