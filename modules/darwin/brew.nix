{ inputs, config, pkgs, ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "aws/tap"
      "homebrew/bundle"
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
      "mistertea/et"
      "mutagen-io/mutagen"
      "sdkman/tap"
      {
        name = "amazon/amazon";
        clone_target = "ssh://git.amazon.com/pkg/HomebrewAmazon";
        force_auto_update = true;
      }
    ];

    brews = [
      "amazon/amazon/env-improvement"
      "amazon/amazon/ninja-dev-sync"
      "aws/tap/aws-sam-cli"
      "mutagen-io/mutagen/mutagen"
      "sdkman-cli"
      "asdf"
      "mint"
    ];

    casks = [
      "1password"
      "appcleaner"
      "android-platform-tools"
      "fork"
      "google-chrome"
      "discord"
      "element"
      "figma"
      "firefox"
      "font-3270-nerd-font"
      "font-fira-code-nerd-font"
      "font-fira-mono-nerd-font"
      "font-hack-nerd-font"
      "font-im-writing-nerd-font"
      "font-jetbrains-mono-nerd-font"
      "font-mononoki-nerd-font"
      "font-ubuntu-mono-nerd-font"
      "insomnia"
      "iterm2"
      "jetbrains-toolbox"
      "kap"
      "kitty"
      "keepingyouawake"
      "obsidian"
      "raycast"
      "obs"
      "rectangle"
      "scroll-reverser"
      "slack"
      "spotify"
      "stretchly"
      "sublime-text"
      "visual-studio-code"
      "vlc"
      "xcodes"
      "zoom"
    ];
  };
}
