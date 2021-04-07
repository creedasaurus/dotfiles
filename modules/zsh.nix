{ config, pkgs, lib, inputs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
 
  };

}
