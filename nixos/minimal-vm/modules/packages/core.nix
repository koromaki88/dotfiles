{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    file
    netcat
    openvpn
    p7zip
    unzip
    usbutils
    vim
    wget
    zip
  ];
}
