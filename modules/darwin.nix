{ config, pkgs, ... }:

{
  users.users.Ludo = {
    name = "Ludo";
    home = "/Users/Ludo";
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 6;
  system.primaryUser = "Ludo";

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
}
