#!/usr/bin/env zsh
# vim: set filetype=zsh :

# if zsh cache dir doesn't exist, create it
if [ ! -d "$XDG_CACHE_HOME/zsh" ]; then
  mkdir -p "$XDG_CACHE_HOME/zsh"
fi

# if zsh data dir doesn't exist, create it
if [ ! -d "$XDG_DATA_HOME/zsh" ]; then
  mkdir -p "$XDG_DATA_HOME/zsh"
fi

zstyle ':zim:zmodule' use 'degit'
zstyle ':zim:completion' dumpfile ${XDG_CACHE_HOME}/zsh/zcompdump
zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache

ZIM_HOME=$XDG_CONFIG_HOME/zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh
