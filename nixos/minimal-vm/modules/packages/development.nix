{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fd
    gcc
    git
    jq
    opencode
    ripgrep
  ];
}
