{ pkgs, ... }:

{
  users.users.cirno = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = [ pkgs.tree ];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';

    shellAliases = {
      ll = "ls -lahF";
      update = "sudo nixos-rebuild switch";
      update-flake = "sudo nixos-rebuild switch --flake .#nixos";
      cleanup = "sudo nix-collect-garbage -d";
    };

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [ "HIST_IGNORE_ALL_DUPS" ];
  };

  environment.systemPackages = [ pkgs.zsh-powerlevel10k ];
}
