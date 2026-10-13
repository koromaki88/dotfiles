{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk21
    nodejs_26
    python3
    rustup
  ];
}
