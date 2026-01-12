{ config, pkgs, ...}:

{
 home.stateVersion = "25.11";
 home.homeDirectory = "/Users/Ludo";
 home.username = "Ludo";

 programs.gpg = {
   enable = true;
 };

 programs.git = {
   enable = true;
      settings = {
        user.name = "Ludovic Logiou";
        user.email = "ludovic.logiou@gmail.com";
        init.defaultBranch = "main";
      };    
    # Inclusions conditionnelles
    includes = [
      {
        condition = "gitdir:~/Qwant/";
        contents = {
          # Ou vous pouvez utiliser 'path' pour pointer vers un fichier
          user = {
            email = "l.logiou@qwant.com";
            name = "Votre Nom Qwant";
          };
          # Ajoutez d'autres configurations spécifiques à Qwant
        };
      }
      {
        condition = "gitdir:~/Perso/";
        contents = {
          user = {
            email = "ludovic.logiou@gmail.com";
            name = "Ludovic Logiou";
          };
        };
      }
      {
        condition = "gitdir:~/original-projects/";
        contents = {
          user = {
            email = "ludovic.logiou@gmail.com";
            name = "Ludovic Logiou";
          };
        };
      }
    ];
 };

 programs.zsh = {
   enable = true;
   enableCompletion= true;
   syntaxHighlighting.enable = true;
   oh-my-zsh = {
     enable = true;
     theme = "bira";
     plugins = [
       "git"
       "ssh-agent"
       "kube-ps1"
       "vault"
       "pass"
       "macos"
     ];
   };
   shellAliases = {
     nrs = "sudo darwin-rebuild switch --flake ~/.config/nix";
     ls = "eza";
     cat = "bat";
   };
 };

 xdg = {
   enable = true;

   configFile."ghostty".source = .config/ghostty;
 };
}
