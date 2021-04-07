{ config, pkgs, libs, ... }:
{
  programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs; [
          "vscode-extensions.golang.go"
      ];
  };
}
