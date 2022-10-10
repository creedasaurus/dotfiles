{ config, pkgs, ... }: {
  system.defaults = {
    # trackpad settings
    trackpad = {
      # enable tap to click
      Clicking = true;
      # firmness level, 0 = lightest, 2 = heaviest
      FirstClickThreshold = 1;
      # firmness level for force touch
      SecondClickThreshold = 1;
    };

    # dock settings
    dock = {
      # auto show and hide dock
      autohide = true;
      # remove delay for showing dock
      # autohide-delay = 0.0;
      tilesize = 50;
      orientation = "bottom";
    };

    NSGlobalDomain = {
      # delay before repeating keystrokes
      InitialKeyRepeat = 30;
      # delay between repeated keystrokes upon holding a key
      KeyRepeat = 1;
    };
  };
}
