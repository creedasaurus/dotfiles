{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # I like fonts, ok.
    nerdfonts
    font-awesome
  ];
}
