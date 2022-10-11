{ config, lib, pkgs, ... }: {
  
  home.packages = with pkgs; [
      git
      gitui
      tig
      delta
      lazygit
    ];

  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };

    ignores = [
      "*~"
      ".DS_Store"
      "*.swp"
      "*.iml"
      "**/build"
      "node_modules"
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
        line-numbers = true;
      };
    };
    lfs.enable = true;
  };
}
