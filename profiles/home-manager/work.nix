{ config, lib, pkgs, ... }: {
  # home.packages = with pkgs; [];

  programs.git = {
    userEmail = "haymd@amazon.com";
    userName = "Creed Haymond";

    includes = [
      {
        condition = "gitdir:~/personal/";
        contents = {
          user = {
            name = "Creed Haymond";
            email = "creedasaurus@gmail.com";
          };
        };
      }
    ];
  };
}
