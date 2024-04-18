#!/usr/bin/env zsh
# vim: set filetype=zsh :


export FZF_DEFAULT_COMMAND="bfs -mindepth 1 -exclude -name .git -type d,f -printf '%P\n' 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="bfs -mindepth 1 -exclude -name .git -type d -printf '%P\n' 2>/dev/null"
export FZF_COMPLETION_TRIGGER=',,'

export FZF_DEFAULT_OPTS='--prompt="" --marker="󰸞" --pointer="" --color=marker:#fabd2f'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  bfs ${1} -exclude -name .git -type d,f -a -not -path ${1} -printf '%P\n'
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  bfs ${1} -exclude -name .git -type d -a -not -path ${1} -printf '%P\n'
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'lsd --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'lsd --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
eval "$(fzf --zsh)"
