# Creed's Dotfiles 

These files are for setting up my machines. Please dont use them except to just test my setup out. I make no gurantees about them.

### Chezmoi

After trying out a few different forms of dotfile management, I actually settled on [`chezmoi`](https://www.chezmoi.io) (for now). I gave `nix` a try for awhile and also `dotbot`, and very briefly some others including my own scripts. I actually tried and decided against `chezmoi` awhile back, but tried it out again recently and decided it was a good balance of the things I wanted my dotfiles manager to do.

Make sure to read the [`chezmoi`](https://www.chezmoi.io) docs, but to get started really quick, you can just run:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply creedasaurus
```

This downloads the latest `chezmoi`, then clones this git repo to the directory `~/.local/share/chezmoi` and then begins the installation of brew packages, and applying dotfiles.

#### Platforms

Right now I only have a basic distinction of configs between my Macbook Pro and Linux. You'll find that a few of my configs are `*.tmpl`, which are Go template files, and chezmoi has a few basic functions to check for the platform type so I can change what is output.

e.g.

```
{{ if ne .chezmoi.os "darwin" }}
.chezmoiscripts/darwin/**
.config/yabai
{{ end }}
```
