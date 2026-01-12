{ config, pkgs, ...}:

{

      homebrew = {
        enable = true;
        taps = [ ];
        brews = [ ];
        casks = [ 
          "calibre" 
          "discord" 
          "datagrip" 
          "firefox" 
          "ghostty" 
          "mitmproxy" 
          "notion" 
          "rectangle" 
          "signal" 
          "slack" 
          "spotify" 
          "tailscale-app" 
          "visual-studio-code" 
          "vlc" 
          "wireshark-app" 
          "orbstack"
        ];
      };
}
