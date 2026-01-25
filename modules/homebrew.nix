{ config, pkgs, ...}:

{

      homebrew = {
        enable = true;
        taps = [ ];
        brews = [ 
          "terraform"
          "pinentry-mac"
          "helm"
         ];
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
          "google-chrome"
        ];
      };
}
