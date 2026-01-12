{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    /*home-manager.inputs.nixpkgs.follows = "nix-darwin";*/
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget

      users.users.Ludo = {
        name = "Ludo";
        home = "/Users/Ludo";
      };
      environment.systemPackages =
        with pkgs; [ pkgs.vim
          neovim
          ansible
          awscli2
          coreutils-full
          curl
	  uv
          go
          oh-my-zsh
          eza
          bat
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;
      system.primaryUser = "Ludo";


      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults = {
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain."com.apple.swipescrolldirection" = false;
        dock = {
          autohide = false;
          orientation = "bottom";
          show-process-indicators = false;
          show-recents = false;
          static-only = true;
          persistent-apps = [
            "/Applications/Firefox.app/"
            "/Applications/Slack.app/"
            "/Applications/Discord.app/"
          ];
        };  
        finder = {
          AppleShowAllExtensions = true;
          ShowPathbar = true;
        };
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#ep-m2504
    darwinConfigurations."ep-m2504" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        ./modules/homebrew.nix 
        ./modules/system.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.Ludo = import ./home.nix;
        }
      ];
    };
  };
}
