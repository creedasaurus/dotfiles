{ inputs, config, pkgs, ... }:
{
  users = {
    users = {
      haymd = {
        shell = pkgs.zsh;
        home = "/Users/haymd";
      };
    };
  };
}
