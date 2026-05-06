{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    ansible
    awscli2
    coreutils-full
    openstackclient-full
    kustomize
    kubectx
    kubecolor
    curl
    uv
    go
    oh-my-zsh
    eza
    bat
    kind
    fzf
    pass
    yq
    jq
    gtop
    ipcalc
    rendercv
    claude-code
    claude-monitor
    cursor-cli
    mtr
    go-task
    screenfetch
  ];
}
