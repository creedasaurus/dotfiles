{ config, pkgs, lib, ... }:
{
  home.sessionVariables = {
    RUSTUP_HOME = "$HOME/rustup";
    CARGO_HOME = "$HOME/cargo";
  };

  home.packages = with pkgs; [
    cargo-outdated
    cargo-update
    rust-analyzer
    rustup
  ];
}
