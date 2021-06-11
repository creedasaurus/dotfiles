# This should be in the .zshenv. But the PATH set here may get clobbered by macos
# because it set's the path from /usr/libexec/path_helper

typeset -U PATH path
path=(
  $HOME/.local/bin
  $HOME/.deno/bin
  $GOBIN
  $HOME/.toolbox/bin
  "$path[@]"
)
export PATH

# Nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
