# Creed's dotfiles

I wanted to try out `nix` for my home management.

Serious thanks to [ipetkov](https://github.com/ipetkov/dotfiles) and [mjlbach](https://github.com/mjlbach/nix-dotfiles) for the inspiration.

### Setting up

The first thing (on MacOS) to do is install `nix`. I use >=Catalina so I installed using:

```
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
```

 and then activated it in my current shell using:

```
. $HOME/.nix-profile/etc/profile.d/nix.sh
```

Then I used nix to install [Flakes](https://nixos.wiki/wiki/Flakes)
```
nix-env -iA nixpkgs.nixFlakes
```

Then for the first time when I go to build this dotfiles repo, I use this command:

```
nix-shell -p nixUnstable --command "nix build --experimental-features 'nix-command flakes' '.#macbook-pro'"
```

Where `.#macbook-pro` could be one of the entries in the `flake.nix` file.

This will run for a little while to cache/build all the things. Once it's done, you can inspect its output in the `result/` directory in the repo. You can check out things like the `dotfiles/result/home-files/.zshrc` to make sure it's what you expected.

But nothin is actually active in your home until you run the `activate` script:

```
./result/activate
```

This will then link everything up into your home directory. If there is a conflict, you can also use `./result/activate --verbose` whick may give you some addition insight into what didn't work if the output message didn't help. Like if you already have some conflicting files, it may alert you to move those before you run `activate` as a precaution. Thank you, nix.

If you want to update the lock file with the latest versions, you can run:

```
nix flake update
```

Then just build and activate again.


