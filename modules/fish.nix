{ config, pkgs, lib, inputs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "exa -la";
      la = "exa -lah";
      lt = "exa --tree --level=2 --long";
    };

    plugins = [
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "2fd3d2157d5271ca3575b13daec975ca4c10577a";
          sha256 = "fl4/Pgtkojk5AE52wpGDnuLajQxHoVqyphE90IIPYFU=";
        };
      }
    ];
  
  };

  home.packages = with pkgs; [
    exa
    bat
  ];
}
