{ config, pkgs, ...}:

{
 home.stateVersion = "25.11";
 home.homeDirectory = "/Users/Ludo";
 home.username = "Ludo";

 home.file.".bash_functions/kubeconfigctl".source = .bash_functions/kubeconfigctl;
 home.file.".bash_functions/k8s".source = .bash_functions/k8s;
 home.file.".bash_functions/macosx".source = .bash_functions/macosx;
 home.file.".bash_functions/osctx".source = .bash_functions/osctx;
 home.file.".bash_functions/utils".source = .bash_functions/utils;


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
     k = "kubectl";
     kubectl = "kubecolor";
   };
   initContent = ''
     for FILE in ''${HOME}/.bash_functions/*; do 
         source $FILE;
     done
   '';
 };

 xdg = {
   enable = true;

   configFile."ghostty".source = .config/ghostty;
 };
}
