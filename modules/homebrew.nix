{ config, pkgs, ...}:

{

      homebrew = {
        enable = true;
        taps = [ ];
	onActivation = {
	  autoUpdate = true;
	  cleanup = "uninstall";
	  upgrade = true;
	};
        brews = [ 
          "terraform"
          "pinentry-mac"
          "helm"
	  "rtk"
	  "kubeseal"
         ];
        casks = [ 
	  "calibre"
	  "claude"
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
	  "whatsapp"
	  "shadow"
        ];
      };
}
