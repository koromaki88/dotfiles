{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    binwalk
    cfr
    foremost
    jadx
    sigrok-cli
    sleuthkit
    strace
    testdisk
    volatility3
    wireshark-cli
  ];
}
