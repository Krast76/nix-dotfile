{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  {
    darwinConfigurations."ep-m2504" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/darwin.nix
        ./modules/packages.nix
        ./modules/system.nix
        ./modules/homebrew.nix
        {
          system.configurationRevision = self.rev or self.dirtyRev or null;
        }
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
