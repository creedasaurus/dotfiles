{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
#     stdlib = ''
# source "$(asdf direnv hook asdf)"
#     '';
  };
}
