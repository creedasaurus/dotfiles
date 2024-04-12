#!/usr/bin/env zsh
# vim: set filetype=zsh :

export FZF_DEFAULT_COMMAND='command fd -H --no-ignore-vcs -E .git -td -tf'
export FZF_ALT_C_COMMAND='command fd -H --no-ignore-vcs -E .git -td'

# export FZF_CTRL_T_OPTS="--bind ctrl-/:toggle-preview --preview 'command bat --color=always --line-range :500 {}' ${FZF_CTRL_T_OPTS}"

# Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'
# export FZF_DEFAULT_OPTS='--height 25%'
# export FZF_DEFAULT_OPTS='--layout=reverse --border'
# export FZF_COMPLETION_OPTS='--info=inline'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift

#   case "$command" in
#     cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
#     export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#     ssh)          fzf --preview 'dig {}'                   "$@" ;;
#     *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
#   esac
# }

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with lsd when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
# zstyle ':fzf-tab:complete:cd:*' popup-min-size 80 12
zstyle ':fzf-tab:complete:z:*' disabled-on any
zstyle ':fzf-tab:complete:zi:*' disabled-on any
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-pad 4

# zstyle ':fzf-tab:*' popup-pad 10 10
zstyle ':fzf-tab:*' popup-min-size 95 10
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
setopt glob_dots

eval "$(fzf --zsh)"
