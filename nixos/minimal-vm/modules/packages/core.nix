{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    file
    netcat
    p7zip
    unzip
    usbutils
    vim
    wget
    zip
  ];
}
