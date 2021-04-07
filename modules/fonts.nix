{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # (nerdfonts.override { 
    #   fonts = [ 
    #     "FiraCode" 
    #     "DroidSansMono" 
    #   ]; 
    # })
    nerdfonts
  ];
}
