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
      "*.iml"
      "**/build"
    ];
    
    aliases = {
      lg = "log --graph --pretty=format:'%Cred%h%Creset - %G? -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    };

    extraConfig = {
      http = { postBuffer = 524288000; };
    };

    delta = {
      enable = true;
      options = {
        side-by-side = true;
      };
    };
  };
}
