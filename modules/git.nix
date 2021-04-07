{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Creed Haymond";
    userEmail = "creedasaurus@gmail.com";
    
    ignores = [
      "*~"
      ".DS_Store"
      "*.swp"
    ];
    
    aliases = {
      lg = "log --graph --pretty=format:'%Cred%h%Creset - %G? -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    };

    delta = {
      enable = true;
      options = {
        side-by-side = true;
      };
    };
  };
}