{ inputs, config, pkgs, ... }:
{
  users = {
    users = {
      creedh = {
        shell = pkgs.zsh;
        home = "/Users/creedh";
      };
    };
  };
}
