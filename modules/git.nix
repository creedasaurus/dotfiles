{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "Creed Haymond";
    userEmail = "creedasaurus@gmail.com";

    
    # aliases = {
    #   lg = "log --graph --pretty=format:'%Cred%h%Creset - %G? -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    # };

    # extraConfig = {
    #   core.autoctrlf = "input";
    #   merge.conflictstyle = "diff3";
    #   pull.ff = "only";
    #   push.default = "matching";
    #   rerere.enabled = "true";
    # };
    # delta.enable = true;
    # delta = {
    #   enable = true;
    #   # options = {
    #   #   side-by-side = true;
    #   # };
    # };
  };
}