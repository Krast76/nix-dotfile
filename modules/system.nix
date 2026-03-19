{ config, pkgs, ... }:

{
  system.defaults = {
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain."com.apple.swipescrolldirection" = false;

    trackpad = {
      TrackpadRightClick = true;
      TrackpadCornerSecondaryClick = 2;
    };

    dock = {
      autohide = false;
      orientation = "bottom";
      show-process-indicators = true;
      show-recents = false;
      static-only = false;
      persistent-apps = [
        { app = "/Applications/Firefox.app/"; }
        { app = "/Applications/Ghostty.app/"; }
        { app = "/Applications/Slack.app/"; }
        { app = "/Applications/Discord.app/"; }
        { app = "/System/Applications/Music.app/"; }
        { spacer = { small = true; }; }
      ];
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
    };
  };
}
